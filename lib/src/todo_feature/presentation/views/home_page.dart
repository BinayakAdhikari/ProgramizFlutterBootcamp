import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/src/config/appConfig.dart';
import 'package:todo_app/src/core/presentation/widgets/todo_widget.dart';
import 'package:todo_app/src/services/sqlite_service.dart';
import 'package:todo_app/src/todo_feature/data/datasource/todo_datasource.dart';
import 'package:todo_app/src/todo_feature/data/repository/todo_repository_impl.dart';
import 'package:todo_app/src/todo_feature/domain/entity/todo_entity.dart';
import 'package:todo_app/src/todo_feature/domain/usecase/add_todo.dart';
import 'package:todo_app/src/todo_feature/domain/usecase/complete_todo.dart';
import 'package:todo_app/src/todo_feature/domain/usecase/get_allDones.dart';
import 'package:todo_app/src/todo_feature/domain/usecase/get_todos.dart';
import 'package:todo_app/src/todo_feature/presentation/views/add_todo_page.dart';
import 'package:todo_app/src/todo_feature/presentation/widgets/home_header.dart';
import 'package:todo_app/src/todo_feature/presentation/widgets/home_todos_list.dart';

import '../../domain/usecase/delete_done.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SqliteService sqliteService = SqliteService();
  late GetAllDones getAllDones;
  late GetTodos getTodos;
  late CompleteTodo completeTodo;
  late AddToDo addToDo;
  late DeleteDone deleteDone;

  List<TodoEntity> todos = [];
  List<DoneEntity> dones = [];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  void getAllData() async {
    await sqliteService.initializeDb();
    // get all dones
    getAllDones = GetAllDones(
      repository: TodoRepositroyImp(
        todoDatasourceImp: TodoDatasourceImp(sqliteService: sqliteService),
      ),
    );

    dones = await getAllDones.execute();

    // get all todos
    getTodos = GetTodos(
      repository: TodoRepositroyImp(
        todoDatasourceImp: TodoDatasourceImp(sqliteService: sqliteService),
      ),
    );

    todos = await getTodos.execute();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _homeView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<Todo> allTask = [];
          for (Todo todo in todos) {
            allTask.add(todo);
          }

          for (Todo todo in dones) {
            allTask.add(todo);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return AddTodoPage(
                  callback: (TodoEntity todoAdd) async {
                    //TODO: Remove Id field
                    if (sqliteService.db.isOpen) {
                      addToDo = AddToDo(
                          repository: TodoRepositroyImp(
                            todoDatasourceImp: TodoDatasourceImp(
                              sqliteService: sqliteService,
                            ),
                          ),
                          todoEntity: todoAdd); //? Goes without id

                      TodoEntity? updatedTodoEntity = await addToDo.execute();
                      if (updatedTodoEntity != null) {
                        setState(() {
                          todos.add(updatedTodoEntity);
                        });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Database not open yet",
                            style: TextStyle(
                              fontSize: AppConfig()
                                  .themeData
                                  .textTheme
                                  .headline4!
                                  .fontSize,
                              fontWeight: AppConfig()
                                  .themeData
                                  .textTheme
                                  .headline4!
                                  .fontWeight,
                              color: white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          );
        },
        backgroundColor: primaryDarker,
        child: SvgPicture.asset(
          "assets/icons/plus.svg",
          color: white,
        ),
      ),
    );
  }

  Widget _homeView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Text(
            "My Todos",
            style: AppConfig().themeData.textTheme.headline3,
          ),
        ),
        Expanded(
          child: HomeTodos(
            data: todos,
            changeDataCallback: (TodoEntity changedTodo) {
              List<TodoEntity> newTodos = [];

              //! can be done better with equality package
              for (Todo todo in todos) {
                if (todo is TodoEntity) {
                  if (todo.id != changedTodo.id) {
                    newTodos.add(todo);
                  }
                }
              }
              DoneEntity changed = changedTodo.getItDone();

              completeTodo = CompleteTodo(
                  doneEntity: changed,
                  repository: TodoRepositroyImp(
                    todoDatasourceImp:
                        TodoDatasourceImp(sqliteService: sqliteService),
                  ),
                  todoEntity: changedTodo);
              setState(() {
                todos = newTodos;
                completeTodo.exectue();
                dones.add(changed);
              });
            },
            deleteCallback: (DoneEntity doneEntity) {
              List<DoneEntity> newDones = [];

              //! can be done better with equality package
              for (Todo done in dones) {
                if (done is DoneEntity) {
                  if (done.id != doneEntity.id) {
                    newDones.add(done);
                  }
                }
              }

              deleteDone = DeleteDone(
                  todoRepository: TodoRepositroyImp(
                    todoDatasourceImp: TodoDatasourceImp(
                      sqliteService: sqliteService,
                    ),
                  ),
                  doneEntity: doneEntity);

              setState(() {
                dones = newDones;
                completeTodo.exectue();
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Text(
            "Done Tasks",
            style: AppConfig().themeData.textTheme.headline3,
          ),
        ),
        Expanded(
          child: HomeTodos(
            data: dones,
          ),
        ),
      ],
    );
  }
}

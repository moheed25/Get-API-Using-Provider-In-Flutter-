
import 'package:flutter/material.dart';
import 'package:proapi/get_provider/Model/todo_model.dart';
import 'package:proapi/get_provider/TodoServices/todo_services.dart';


class TodoProvider extends ChangeNotifier{

  final TodoServices _todoServices = TodoServices();

  bool _loading = false;
  bool get loading => _loading;


  enableLoading(){
    _loading = true;
    notifyListeners();
  }

  disableLoading(){
    _loading = false;
    notifyListeners();
  }

  List<Todo> _todo = [];
  List<Todo> get todo=> _todo;

  Future<void> getAllTodo()async{
    //Loading starts
    enableLoading();

    //Loads the todo
     _todo = await _todoServices.getTodo();
     notifyListeners();

     //finally disable loading after todo loaded
     disableLoading();
  }

  init(){
    getAllTodo();
    notifyListeners();
  }


}
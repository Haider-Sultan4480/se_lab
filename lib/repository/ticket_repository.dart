import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:se_lab/classes/log_table.dart';
import 'package:se_lab/classes/ticket_model.dart';
import 'package:se_lab/repository/logtable_repository.dart';

class TicketRepository{
  static TicketRepository? _instance;
  TicketRepository._();

  // Factory constructor to create or retrieve the instance
  factory TicketRepository() {
    _instance ??= TicketRepository._(); 
    return _instance!;
  }

  // Your other class methods and properties here
  final _db = FirebaseFirestore.instance;
  
  void createTicket(BuildContext context, TicketModel ticket) async {
    try {
      await _db.collection("Ticket").add(ticket.toJson());
      final snackBar =  SnackBar(
        content: Text("Ticket has been added."),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      final snackBar = SnackBar(
        content: Text("Error adding Ticket: $e"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //////////////////log table /////////////////////////
      final log = LogTable(
        page_name: "ticket_repository",
        error: e.toString(),
      );
      final logRepository = LogTableRepository();
      // ignore: use_build_context_synchronously
      logRepository.createLog(context, log);
    }
  }

  Future<void> updateTicketRecord(TicketModel ticket) async{
    await _db.collection("Ticket").doc(ticket.id).update(ticket.toJson());
    print("Successfully updated");
  }
}
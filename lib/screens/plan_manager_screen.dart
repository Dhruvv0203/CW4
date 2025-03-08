import 'package:flutter/material.dart';
import '../models/plan.dart';
import '../widgets/plan_list.dart';

class PlanManagerScreen extends StatefulWidget {
  const PlanManagerScreen({super.key});

  @override
  State<PlanManagerScreen> createState() => _PlanManagerScreenState();
}

class _PlanManagerScreenState extends State<PlanManagerScreen> {
  final List<Plan> _plans = [];

  void _addPlan(String name, String description, DateTime date, String priority) {
    setState(() {
      _plans.add(Plan(name: name, description: description, date: date, priority: priority));
      _sortPlansByPriority();
    });
  }

  void _editPlan(int index, String newName, String newDescription, DateTime newDate, String priority) {
    setState(() {
      _plans[index].name = newName;
      _plans[index].description = newDescription;
      _plans[index].date = newDate;
      _plans[index].priority = priority;
      _sortPlansByPriority();
    });
  }

  void _toggleComplete(int index) {
    setState(() {
      _plans[index].isCompleted = !_plans[index].isCompleted;
    });
  }

  void _deletePlan(int index) {
    setState(() {
      _plans.removeAt(index);
    });
  }

  void _sortPlansByPriority() {
    _plans.sort((a, b) {
      const priorities = {'High': 1, 'Medium': 2, 'Low': 3};
      return priorities[a.priority]!.compareTo(priorities[b.priority]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adoption & Travel Planner')),
      body: PlanList(
        plans: _plans,
        onEdit: _editPlan,
        onToggleComplete: _toggleComplete,
        onDelete: _deletePlan,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Function to open a modal for creating a plan
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

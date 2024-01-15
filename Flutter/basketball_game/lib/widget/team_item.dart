import 'package:flutter/material.dart';

class TeamItem extends StatefulWidget {
  const TeamItem({super.key, required this.teamName, required this.isBlack});
  final String teamName;
  final bool isBlack;

  @override
  State<TeamItem> createState() => _TeamItemState();
}

class _TeamItemState extends State<TeamItem> {
  int _puntuation = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(9))),
        margin: const EdgeInsets.all(4),
        elevation: 3,
        color: widget.isBlack ? Colors.white54 : Colors.white,
        shadowColor: widget.isBlack ? Colors.white : Colors.black,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(widget.teamName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 65,
                  )),
              Container(
                decoration: const BoxDecoration(),
                child: Text(
                  '$_puntuation',
                  style: TextStyle(
                      color: widget.isBlack
                          ? Colors.orange
                          : Colors.orange.shade600,
                      fontSize: 65),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _puntuation += 3;
                      });
                    },
                    child: const Text("Triple"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _puntuation += 2;
                      });
                    },
                    child: const Text("Double"),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _puntuation++;
                      });
                    },
                    child: const Text("Single"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

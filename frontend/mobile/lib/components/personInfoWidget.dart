import 'package:flutter/material.dart';

class PersonInfoWidget extends StatelessWidget {
  TextEditingController Name = new TextEditingController();
  TextEditingController PhoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListBody(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 200,
                child: new TextFormField(
                  controller: Name,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Container(
                width: 200,
                child: new TextFormField(
                  controller: PhoneNumber,
                  decoration: const InputDecoration(
                      labelText: 'PhoneNumber',
                      border: OutlineInputBorder()
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

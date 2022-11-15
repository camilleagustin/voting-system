import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/models/radio_model.dart';
import 'package:voting_app/screens/user/vote_screen.dart';
import 'package:voting_app/widgets/radio_item.dart';

class VoteContainer extends StatefulWidget {
  final String position;
  final Future<List<RadioModel>> candidates;

  const VoteContainer({Key key, this.position, this.candidates})
      : super(key: key);

  @override
  _VoteContainerState createState() => _VoteContainerState();
}

class _VoteContainerState extends State<VoteContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.candidates,
      initialData: [RadioModel(isSelected: false, text: 'Loading...')],
      builder:
          (BuildContext context, AsyncSnapshot<List<RadioModel>> candidates) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.position.toUpperCase(),
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: candidates.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(
                        () {
                          candidates.data
                              .forEach((element) => element.isSelected = false);
                          candidates.data[index].isSelected = true;

                          String candidate = candidates.data[index].text;
                          switch (widget.position) {
                            case 'president':
                              VoteScreen.president = candidate;
                              break;
                            case 'vice president':
                              VoteScreen.vicePresident = candidate;
                              break;
                            case 'secretary':
                              VoteScreen.secretary = candidate;
                              break;
                            case 'treasurer':
                              VoteScreen.treasurer = candidate;
                              break;
                            case 'auditor':
                              VoteScreen.auditor = candidate;
                              break;
                            case 'peace officer':
                              VoteScreen.peaceOfficer = candidate;
                              break;
                            case 'information officer':
                              VoteScreen.informationOfficer = candidate;
                              break;
                            case 'interfaith(catholic)':
                              VoteScreen.interfaithCatholic = candidate;
                              break;
                            case 'interfaith(noncatholic)':
                              VoteScreen.interfaithNonCatholic = candidate;
                              break;
                            case 'outreach officer':
                              VoteScreen.outreachOfficer = candidate;
                              break;
                          }
                        },
                      );
                    },
                    child: RadioItem(candidates.data[index]),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

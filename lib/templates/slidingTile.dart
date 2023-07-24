import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidingTile extends StatelessWidget {
  final String topLeftText;
  final String bottomLeftText;
  final String tileTopText;
  final String tileMidText;
  final String tileBtmText;
  final String tileTopRight;
  final Color lineColor;
  final Color firstColor;
  final Color secondColor;
  final IconData firstIcon;
  final IconData secondIcon;
  final Function() firstAction;
  final Function() secondAction;

  /// * Min SDK 19
  /// * share_plus
  /// * flutter_slidable
  const SlidingTile(
      {Key? key,
      required this.topLeftText,
      required this.bottomLeftText,
      required this.tileTopText,
      required this.tileMidText,
      required this.tileBtmText,
      required this.tileTopRight,
      required this.lineColor,
      required this.firstColor,
      required this.secondColor,
      required this.firstIcon,
      required this.secondIcon,
      required this.firstAction,
      required this.secondAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(topLeftText), Text(bottomLeftText)]),
          const SizedBox(width: 5),
          const VerticalDivider(),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.grey.shade200,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Slidable(
                  key: const ValueKey(0),
                  endActionPane:
                      ActionPane(motion: const DrawerMotion(), children: [
                    Expanded(
                      child: Builder(builder: (context) {
                        return Container(
                            decoration: BoxDecoration(color: firstColor),
                            child: IconButton(
                              onPressed: () {
                                firstAction();
                                Slidable.of(context)?.close();
                              },
                              icon: const Icon(Icons.share_rounded),
                              color: Colors.white,
                            ));
                      }),
                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        return Container(
                            decoration: BoxDecoration(color: secondColor),
                            child: IconButton(
                              onPressed: () {
                                secondAction();
                                Slidable.of(context)?.close();
                              },
                              icon: const Icon(Icons.notification_add_rounded),
                              color: Colors.white,
                            ));
                      }),
                    )
                  ]),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        lineColor,
                        lineColor,
                        Theme.of(context).scaffoldBackgroundColor,
                        Theme.of(context).scaffoldBackgroundColor
                      ], stops: const [
                        0,
                        0.02,
                        0.02,
                        1
                      ]),
                    ),
                    child: Builder(builder: (context) {
                      var tap = 0;
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: LayoutBuilder(
                          builder: (context, constraintsTop) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tileTopText,
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        ),
                                        Text(
                                          tileTopRight,
                                          style: TextStyle(
                                              color: Colors.grey.shade600),
                                        )
                                      ]),
                                  Text(
                                    tileMidText,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxWidth:
                                                constraintsTop.maxWidth - 50),
                                        child: Text(
                                          tileBtmText,
                                          maxLines: 3,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                          onTap: () {
                                            tap.isEven
                                                ? Slidable.of(context)
                                                    ?.openEndActionPane()
                                                : Slidable.of(context)?.close();
                                            tap++;
                                          },
                                          child: Icon(
                                            Icons.more_vert_rounded,
                                            color: Colors.grey.shade600,
                                          ))
                                    ],
                                  ),
                                ]);
                          },
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlidingDoubleTile extends StatelessWidget {
  final String topLeftText;
  final String bottomLeftText;
  final String tileTopText1;
  final String tileMidText1;
  final String tileBtmText1;
  final String tileTopRight1;
  final Color lineColor1;
  final Color firstColor1;
  final Color secondColor1;
  final IconData firstIcon1;
  final IconData secondIcon1;
  final Function() firstAction1;
  final Function() secondAction1;
  final String tileTopText2;
  final String tileMidText2;
  final String tileBtmText2;
  final String tileTopRight2;
  final Color lineColor2;
  final Color firstColor2;
  final Color secondColor2;
  final IconData firstIcon2;
  final IconData secondIcon2;
  final Function() firstAction2;
  final Function() secondAction2;

  const SlidingDoubleTile(
      {Key? key,
      required this.topLeftText,
      required this.bottomLeftText,
      required this.tileTopText1,
      required this.tileMidText1,
      required this.tileBtmText1,
      required this.tileTopRight1,
      required this.lineColor1,
      required this.firstColor1,
      required this.secondColor1,
      required this.firstIcon1,
      required this.secondIcon1,
      required this.firstAction1,
      required this.secondAction1,
      required this.tileTopText2,
      required this.tileMidText2,
      required this.tileBtmText2,
      required this.tileTopRight2,
      required this.lineColor2,
      required this.firstColor2,
      required this.secondColor2,
      required this.firstIcon2,
      required this.secondIcon2,
      required this.firstAction2,
      required this.secondAction2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [Text(topLeftText), Text(bottomLeftText)]),
          const SizedBox(width: 5),
          const VerticalDivider(),
          const SizedBox(width: 5),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Colors.grey.shade200,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                Expanded(
                                  child: Builder(builder: (context) {
                                    return Container(
                                        decoration:
                                            BoxDecoration(color: firstColor1),
                                        child: IconButton(
                                          onPressed: () {
                                            firstAction1();
                                            Slidable.of(context)?.close();
                                          },
                                          icon: Icon(firstIcon1),
                                          color: Colors.white,
                                        ));
                                  }),
                                ),
                                Expanded(
                                  child: Builder(builder: (context) {
                                    return Container(
                                        decoration:
                                            BoxDecoration(color: secondColor1),
                                        child: IconButton(
                                          onPressed: () {
                                            secondAction1();
                                            Slidable.of(context)?.close();
                                          },
                                          icon: Icon(secondIcon1),
                                          color: Colors.white,
                                        ));
                                  }),
                                )
                              ],
                            ),
                            child: Builder(builder: (context) {
                              var tap = 0;
                              return Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        lineColor1,
                                        lineColor1,
                                        Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ],
                                      stops: const [0, 0.02, 0.02, 1],
                                    ),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: LayoutBuilder(
                                    builder: (context, constrains) {
                                  return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tileTopText1,
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                tileTopRight1,
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              )
                                            ]),
                                        Text(
                                          tileMidText1,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        constrains.maxWidth -
                                                            50),
                                                child: Text(
                                                  tileBtmText1,
                                                  maxLines: 3,
                                                )),
                                            const Spacer(),
                                            GestureDetector(
                                                onTap: () {
                                                  tap.isEven
                                                      ? Slidable.of(context)
                                                          ?.openEndActionPane()
                                                      : Slidable.of(context)
                                                          ?.close();
                                                  tap++;
                                                },
                                                child: Icon(
                                                  Icons.more_vert_rounded,
                                                  color: Colors.grey.shade600,
                                                ))
                                          ],
                                        ),
                                      ]);
                                }),
                              );
                            }),
                          ),
                        ),
                      ),
                      // 2nd half
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              children: [
                                Expanded(
                                  child: Builder(builder: (context) {
                                    return Container(
                                        decoration:
                                            BoxDecoration(color: firstColor2),
                                        child: IconButton(
                                          onPressed: () {
                                            firstAction2();
                                            Slidable.of(context)?.close();
                                          },
                                          icon: Icon(firstIcon2),
                                          color: Colors.white,
                                        ));
                                  }),
                                ),
                                Expanded(
                                  child: Builder(builder: (context) {
                                    return Container(
                                        decoration:
                                            BoxDecoration(color: secondColor2),
                                        child: IconButton(
                                          onPressed: () {
                                            secondAction2();
                                            Slidable.of(context)?.close();
                                          },
                                          icon: Icon(secondIcon2),
                                          color: Colors.white,
                                        ));
                                  }),
                                )
                              ],
                            ),
                            child: Builder(builder: (context) {
                              var tap = 0;
                              return LayoutBuilder(
                                  builder: (context, constrains) {
                                return Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          lineColor2,
                                          lineColor2,
                                          Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          Theme.of(context)
                                              .scaffoldBackgroundColor
                                        ],
                                        stops: const [0, 0.02, 0.02, 1],
                                      ),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tileTopText2,
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              ),
                                              Text(
                                                tileTopRight2,
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade600),
                                              )
                                            ]),
                                        Text(
                                          tileMidText2,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            ConstrainedBox(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        constrains.maxWidth -
                                                            50),
                                                child: Text(tileBtmText2)),
                                            const Spacer(),
                                            GestureDetector(
                                                onTap: () {
                                                  tap.isEven
                                                      ? Slidable.of(context)
                                                          ?.openEndActionPane()
                                                      : Slidable.of(context)
                                                          ?.close();
                                                  tap++;
                                                },
                                                child: Icon(
                                                  Icons.more_vert_rounded,
                                                  color: Colors.grey.shade600,
                                                ))
                                          ],
                                        ),
                                      ]),
                                );
                              });
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Divider(
                      indent: 10,
                      endIndent: 10,
                      thickness: 1.5,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

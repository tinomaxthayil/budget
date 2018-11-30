import 'budgetList.dart';
import 'package:flutter/material.dart';

class budDisp extends StatefulWidget {
  final budList bud;

  budDisp(this.bud);

  @override
  budDispState createState() => budDispState(bud);
}

class budDispState extends State<budDisp> {
  budList bud;

  budDispState(this.bud);
  String renderUrl;

  Widget get budImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
    renderbudPic();
  }

  void renderbudPic() async {
    await bud.getImageUrl();
    setState(() {
      renderUrl = bud.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Container(
      height: 115.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 50.0,
            child: budCard,
          ),
          Positioned(top: 7.5, child: budImage),
        ],
      ),
    ),
  );
}

  Widget get budCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.bud.budName,
                  style: Theme.of(context).textTheme.headline),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.attach_money,
                  ),
                  Text(': ${widget.bud.amt}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

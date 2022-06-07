import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:school_apps/model/carousel_ujian.dart';

import '../../../../constants.dart';

class SliderUjian extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SliderUjian> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Swiper(
                  onIndexChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  // autoplay: true,
                  layout: SwiperLayout.DEFAULT,
                  itemCount: carousels.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            carousels[index].image,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: map<Widget>(
                      carousels,
                          (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 6,
                          width: 6,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Colors.white
                                  : mGreyColor),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
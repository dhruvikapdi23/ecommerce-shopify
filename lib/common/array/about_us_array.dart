import 'package:multikart/config.dart';

var aboutUs = AboutUsModel(
    title: "title",
    desc1: "helpListDec",
    desc2: "aboutDesc",
    desc3: "aboutDesc",
    ourBrand: "ourBrand",
    statistic: [
      Statistic(
          count: 150,
          title: "+ users",
          image: svgAssets.users,
          desc: "Multikart have 150+ register users online store"),
      Statistic(
          count: 50,
          title: "+ stores",
          image: svgAssets.shop,
          desc: "Multikart have 50+ stores worldwide."),
      Statistic(
          count: 1.5,
          title: "M+ orders",
          image: svgAssets.delivery,
          desc: "Multikart has 1.5M+ total orders till now."),
      Statistic(
          count: 100,
          title: "+ Brands",
          image: svgAssets.diamond,
          desc: "Multikart has 100+ brands in our stores."),
    ]);

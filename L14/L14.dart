import 'dart:convert';

var parentId = "";
List<Map<String, dynamic>> menuList = [
  {"id": 0, "menuName": "Root", parentId: "#"},
  {"id": 1, "menuName": "A", parentId: 0},
  {"id": 2, "menuName": "B", parentId: 0},
  {"id": 3, "menuName": "C", parentId: 5},
  {"id": 4, "menuName": "D", parentId: 5},
  {"id": 5, "menuName": "E", parentId: 0},
  {"id": 6, "menuName": "F", parentId: 5},
  {"id": 7, "menuName": "G", parentId: 1},
  {"id": 8, "menuName": "H", parentId: 1},
  {"id": 9, "menuName": "I", parentId: 6},
  {"id": 10, "menuName": "J", parentId: 6},
  {"id": 11, "menuName": "K", parentId: 3},
  {"id": 12, "menuName": "L", parentId: 3},
  {"id": 13, "menuName": "M", parentId: 3},
  {"id": 14, "menuName": "N", parentId: 12},
  {"id": 15, "menuName": "O", parentId: 12},
  {"id": 16, "menuName": "P", parentId: 18},
  {"id": 17, "menuName": "Q", parentId: 18},
  {"id": 18, "menuName": "R", parentId: 10},
  {"id": 19, "menuName": "S", parentId: 10},
  {"id": 20, "menuName": "T", parentId: 10}
];

Map<String, Map<String, dynamic>> convertListMenuToMapMenu(menuList) {
  Map<String, Map<String, dynamic>> mapMenu = {};
  for (var i = 0; i < menuList.length; i++) {
    mapMenu.addAll({
      "${menuList[i]["id"]}": {
        "id": menuList[i]["id"],
        "menuName": "${menuList[i]["menuName"]}"
      }
    });
  }
  return mapMenu;
}

Map<String, dynamic> buildGroup(menuList) {
  List<int> id = [] ;
  Map<String, List<int>> groupParentId = {};
  for (var i = 0; i < menuList.length; i++) {
    if (menuList[i]["id"].toString() == menuList[i][parentId].toString()) {
      id.add(
        menuList[i]["id"],
      );
    }
    groupParentId.addAll({
        "${menuList[i][parentId]}": id
      });
  }
 return groupParentId;
}

List<Map<String, dynamic>> buildTree(menuMap, parentIdGroups, parentIdRoot) {
  var currentParentIdGroup;
  if ((currentParentIdGroup == parentIdGroups[parentIdRoot]) ||
      (currentParentIdGroup == [])) {
    return currentParentIdGroup.map((menuId, menuIdIndex) {
      var menuItem = menuMap[menuId];
      var parentIdNext = parentIdGroups[parentIdRoot][menuIdIndex];
      List<Map<String, dynamic>> childrenMenuItem =
          buildTree(menuMap, parentIdGroups, parentIdNext);
      if (childrenMenuItem.length > 0) menuItem["children"] = childrenMenuItem;
      return menuItem;
    }).toList();
  }
  return currentParentIdGroup;
}

dynamic convertToNesthJson() {
  var id = "";
  var menuName = "";
  Map<String, Map<String, dynamic>> menuMap = {
    '0': {id: 0, menuName: 'Root'},
    '1': {id: 1, menuName: 'A'},
    '2': {id: 2, menuName: 'B'},
    '3': {id: 3, menuName: 'C'},
    '4': {id: 4, menuName: 'D'},
    '5': {id: 5, menuName: 'E'},
    '6': {id: 6, menuName: 'F'},
    '7': {id: 7, menuName: 'G'},
    '8': {id: 8, menuName: 'H'},
    '9': {id: 9, menuName: 'I'},
    '10': {id: 10, menuName: 'J'},
    '11': {id: 11, menuName: 'K'},
    '12': {id: 12, menuName: 'L'},
    '13': {id: 13, menuName: 'M'},
    '14': {id: 14, menuName: 'N'},
    '15': {id: 15, menuName: 'O'},
    '16': {id: 16, menuName: 'P'},
    '17': {id: 17, menuName: 'Q'},
    '18': {id: 18, menuName: 'R'},
    '19': {id: 19, menuName: 'S'},
    '20': {id: 20, menuName: 'T'}
  };
  Map<String, dynamic> parentIdGroups = {
    '0': [1, 2, 5],
    '1': [7, 8],
    '3': [11, 12, 13],
    '5': [3, 4, 6],
    '6': [9, 10],
    '10': [18, 19, 20],
    '12': [14, 15],
    '18': [16, 17],
    '#': [0]
  };
  var tree = buildTree(menuMap, parentIdGroups, '#');
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(tree);
  print(prettyprint);
}

void main() {
  //L14.1===Show ConvertListMenuToMapMenu===//
  var convertiontomapmenu = convertListMenuToMapMenu(menuList);
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(convertiontomapmenu);
  print(prettyprint);
  //L14.3===Show buildGroupParrentID===//
  var groupParrentId = buildGroup(menuList);
  String prettyprintGroup = encoder.convert(groupParrentId);
  print(prettyprintGroup);
  //L14.3===Show ConvertNesthJson===//
  convertToNesthJson();
}

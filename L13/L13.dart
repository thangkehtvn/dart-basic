import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:ansicolor/ansicolor.dart';

void showScript() {
  print("========>Đài Tiếng Nói Việt Nam<========");
  print("Nhấn phím 1 : Nghe Tiếng Việt");
  print("Nhấn phím 2 : Gặp Tổng Viên");
  print("Nhấn phím 3 : Để Nghe Lại");
  print("Nhấn phím 0 : Để Kết Thúc");
  stdout.writeln("Mời bạn nhập một số từ 1-> 3 để lựa chọn : ");
  var stringValue = stdin.readLineSync();
  var chooseNumber = int.tryParse(stringValue);
  switch (chooseNumber) {
    case 1:
      print("Giữ phím để nghe Tiếng Việt");
      break;
    case 2:
      print("Chào mừng bạn đã gặp Tổng Viên");
      break;
    case 3:
      print("Vui lòng nhấn lại phím để Nghe Lại");
      showScript();
      break;
    default:
      exit(0);
  }
}

int inputNumber() {
  var stringValue = stdin.readLineSync();
  var number = int.tryParse(stringValue);
  return number;
}

void getNumber() {
  int number = inputNumber();
  switch (number) {
    case 1:
      print("Giữ phím để nghe Tiếng Việt");
      break;
    case 2:
      print("Chào mừng bạn đã gặp Tổng Viên");
      break;
    case 3:
      print("Vui lòng nhấn lại phím để Nghe Lại");
      showScript();
      break;
    default:
      print("Không có lựa chọn nào");
  }
}

void showMenuScript() {
  getNumber();
  print("========>Đài Tiếng Nói Việt Nam<========");
  print("Nhấn phím 1 : Nghe Tiếng Việt");
  print("Nhấn phím 2 : Gặp Tổng Viên");
  print("Nhấn phím 3 : Để Nghe Lại");
  print("Mời bạn nhập số để lựa chọn :");
}

void showNumberInArray() {
  var numberList = [1, 25, 12, 26, 9];
  var random = new Random();
  var number = numberList[random.nextInt(numberList.length)];
  print('a${[0]} = $number');
  print('a${[0]} = ' + number.toString());
}

void showArray(List<int> arr) {
  for (var i in arr) {
    stdout.write(' $i ');
  }
}

void showMatrixList() {
  List<List<int>> matrixList = [
    [2, 5, 6, 14, 56],
    [3, 24, 56, 4, 12],
    [36, 13, 24, 1, 23],
    [12, 23, 1, 67, 45],
    [64, 1, 78, 3, 24]
  ];
  print("matrix = ${matrixList[2][2]}");
  print("matrix = " + matrixList[3][3].toString());
}

void showMatrixMap() {
  Map<int, List<int>> matrixMap = {
    0: [2, 5, 6, 14, 56],
    1: [3, 24, 56, 4, 12],
    2: [36, 13, 24, 1, 23],
    3: [12, 23, 1, 67, 45],
    4: [64, 1, 78, 3, 24]
  };
  print("matrix = ${matrixMap[2][2]}");
  print("matrix = " + matrixMap[3][3].toString());
}

void showJsonMap() {
  Map<String, dynamic> jsonMap = {
    'Name': 'thangdeptrai',
    'Age': 26,
    'Men': true
  };
  print("Name : ${jsonMap['Name']}");
  print("Tuổi : " + jsonMap['Age'].toString());
  print("Men : " + jsonMap['Men'].toString());
}

void sortDescInArray(List<int> arr) {
  int temp = arr[0];
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] < arr[j]) {
        temp = arr[j];
        arr[j] = arr[i];
        arr[i] = temp;
      }
    }
  }
}

dynamic sortAscInArray(List<int> arr) {
  return arr.sort();
}

void showSortInArray(List<int> arr, String sortType) {
  switch (sortType) {
    case "desc":
      print("Mảng sau khi được săp xếp giảm giần");
      sortDescInArray(arr);
      showArray(arr);
      print("\n");
      break;
    case "asc":
      print("Mảng sau khi được săp xếp tăng giần");
      sortAscInArray(arr);
      showArray(arr);
      print("\n");
      break;
    default:
      print("Nothing to show in array");
  }
}

bool searchInArray(List<int> arr, int x) {
  for (int i = 0; i < arr.length; i++) {
    (x == arr[i]) ? true : null;
  }
  return false;
}

int binarySearchInArray(List<int> arr, int value) {
  int r = arr.length - 1;
  int l = 0;
  while (r >= l) {
    int mid = (l + (r - l) / 2).ceil();
    if (arr[mid] == value) return mid;
    if (arr[mid] > value) r = mid - 1;
    l = mid + 1;
  }
  return -1;
}

void showSearchInArray(List<int> arr, String searchType, int value) {
  sortAscInArray(arr);
  switch (searchType) {
    case "searchElement":
      bool check = searchInArray(arr, value);
      if (check == true) {
        print("Tìm thấy $value trong mảng");
      } else {
        print("Không tìm thấy $value trong mảng");
      }
      break;
    case "binarySearchElement":
      int check = binarySearchInArray(arr, value);
      if (check == -1) {
        print("Không tìm thấy $value trong mảng");
      } else {
        print("Tìm thấy $value trong mảng");
      }
      break;
    default:
      print("Nothing to Search");
  }
}

List<Map<String, dynamic>> converRawJsonToNetshJson(
    List<Map<String, dynamic>> listJson, dynamic parentIdRoot) {
  List<Map<String, dynamic>> converListJson = [];
  for (var i = 0; i < listJson.length; i++) {
    if (listJson[i]["parentId"] == parentIdRoot) {
      var node = listJson[i];
      converListJson.add({
        "id": node["id"],
        "menuName": node["menuName"],
        "children": converRawJsonToNetshJson(listJson, node["id"])
      });
    }
  }
  return converListJson;
}

void main() {
  List<int> matrixList = [12, 3, 56, 5, 1];
  AnsiPen yellowText = AnsiPen()..yellow(bold: true);
  List<Map<String, dynamic>> rawJson = [
    {"id": 1, "menuName": "A", "parentId": null},
    {"id": 2, "menuName": "AB", "parentId": null},
    {"id": 3, "menuName": "ABC", "parentId": 2},
    {"id": 4, "menuName": "ABCD", "parentId": 3},
    {"id": 5, "menuName": "AE", "parentId": 1},
    {"id": 6, "menuName": "AF", "parentId": 1},
    {"id": 7, "menuName": "G", "parentId": null},
    {"id": 8, "menuName": "H", "parentId": 6},
    {"id": 9, "menuName": "K", "parentId": 3},
    {"id": 10, "menuName": "L", "parentId": 1},
    {"id": 11, "menuName": "AK", "parentId": 4},
    {"id": 12, "menuName": "THANG", "parentId": null},
    {"id": 13, "menuName": "ET", "parentId": null},
  ];
  var converRawJson = converRawJsonToNetshJson(rawJson, null);
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String nesthJson = encoder.convert(converRawJson);
  int luachonMenu;
  print("=====>MENU PROGRAM<=====");
  print("Nhấn phím 1====>Show Script====");
  print("Nhấn phím 2====>Show NumberInArray<====");
  print("Nhấn phím 3====>Show MatrixList<====");
  print("Nhấn phím 4====>Show MatrixMap<====");
  print("Nhấn phím 5====>Show JsonMap<====");
  print("Nhấn phím 6====>Show SortDescInArray<====");
  print("Nhấn phím 7====>Show SortAscInArray<====");
  print("Nhấn phím 8====>Show SearchInArray<====");
  print("Nhấn phím 9====>Show BinarySearchInArray<====");
  print("Nhấn phím 10====>Show NesthJson<====");
  print("Nhấn phím 0====>Exit Program<====");
  print("====>Mời bạn nhập từ 1->10 để chọn Menu<====");
  do {
    var string = stdin.readLineSync();
    luachonMenu = int.tryParse(string);
    switch (luachonMenu) {
      case 1: // L12.1.1 kịch bản tổng đài 1 hàm
        showScript();
        print("Tiếp tục nhập các số để lựa chọn");
        break;
      case 2: // L12.2.1 khai báo và sử dụng array số nguyên
        print("====>Show NumberInArray<====");
        showNumberInArray();
        break;
      case 3: // L12.2.2 khai báo và sử dụng ma trận số nguyên bằng List & Map
        print("====>Show MatrixList<====");
        showMatrixList();
        break;
      case 4: // L12.2.2 khai báo và sử dụng ma trận số nguyên bằng List & Map
        print("====>Show MatrixMap<====");
        showMatrixMap();
        break;
      case 5: // L12.2.3 khai báo và sử dụng dữ liệu json tổng hợp(từa lưa kiểu) bằng Map
        print("====>Show JsonMap<====");
        showJsonMap();
        break;
      case 6: // L12.3 sắp xếp mảng số nguyên
        print("====>Show SortDescInArray<====");
        showSortInArray(matrixList, "desc");
        break;
      case 7: // L12.3 sắp xếp mảng số nguyên
        print("====>Show SortAscInArray<====");
        showSortInArray(matrixList, "asc");
        break;
      case 8: // L12.4 tìm kiếm phần tử bất kỳ trong mảng
        print("====>Show SearchInArray<====");
        showSearchInArray(matrixList, "searchElement", 125);
        break;
      case 9: // L12.5 tìm kiếm nhị phân phần tử bất kỳ trong mảng
        print("====>Show BinarySearchInArray<====");
        showSearchInArray(matrixList, "binarySearchElement", 56);
        break;
      case 10: // L12.6 Convert row Json to nesth Json
        print("====>Show NesthJson<====");
        print(converRawJson);
        print(yellowText(nesthJson));
        break;
      case 0:
        exit(0);
        break;
      default:
        print("Nothing to selection");
    }
  } while (luachonMenu != 0);
}

import 'dart:io';
import 'dart:math';

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

dynamic getNumber() {
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
  print("matrix = ${matrixList[2]}");
  print("matrix = " + matrixList[2].toString());
}

void showMatrixMap() {
  Map<int, List<int>> matrixMap = {
    0: [2, 5, 6, 14, 56],
    1: [3, 24, 56, 4, 12],
    2: [36, 13, 24, 1, 23],
    3: [12, 23, 1, 67, 45],
    4: [64, 1, 78, 3, 24]
  };

  print('''
            ${matrixMap[0][1]}
            ${matrixMap[1][1]}
            ''');

  print("matrixMap " + matrixMap[0][0].toString());
}

void showJsonMap() {
  Map<String, dynamic> jsonMap = {'Name': 'thangdeptrai', 'Age': 26};
  print("Name : ${jsonMap['Name']}");
  print("Tuổi : " + jsonMap['Age'].toString());
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

int binarySearchInArray(List<int> arr, int giaTri) {
  int r = arr.length - 1; // chỉ số phần tử cuối
  int l = 0; // Chỉ số phần tử đầu tiên
  while (r >= l) {
    int mid = (l + (r - l) / 2).ceil();
        
             // Tương đương (l+r)/2 nhưng ưu điểm tránh tràn số khi l,r lớn

    // Nếu arr[mid] = x, trả về chỉ số và kết thúc.
    if (arr[mid] == giaTri) return mid;

    // Nếu arr[mid] > x, cập nhật lại right
    if (arr[mid] > giaTri) r = mid - 1;
    // Nếu arr[mid] > x, cập nhật lại left
    l = mid + 1;
  }

  // Nếu không tìm thấy
  return -1;
}

void showSearchInArray(List<int> arr, String searchType, int giaTri) {
  sortAscInArray(arr);
  int n = arr.length;

  switch (searchType) {
    case "searchElement":
      bool check = searchInArray(arr, giaTri);
      if (check == true) {
        print("Tìm thấy $giaTri trong mảng");
      } else {
        print("Không tìm thấy $giaTri trong mảng");
      }
      break;
    case "binarySearchElement":
      int check = binarySearchInArray(arr, giaTri);
      if (check == -1) {
        print("Không tìm thấy $giaTri trong mảng");
      } else {
        print("Tìm thấy $giaTri trong mảng");
      }
      break;
    default:
      print("Nothing to Search");
  }
}

void main() {
  List<int> matrixList = [12, 3, 56, 5, 1];
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
  print("Nhấn phím 0====>Exit Program<====");
  print("====>Mời bạn nhập từ 1->9 để chọn Menu<====");
  do {
    var string = stdin.readLineSync();
    luachonMenu = int.tryParse(string);
    switch (luachonMenu) {
      case 1:
        showScript();
        print("Tiếp tục nhập các số để lựa chọn");
        break;
      case 2:
        print("====>Show NumberInArray<====");
        showNumberInArray();
        break;
      case 3:
        print("====>Show MatrixList<====");
        showMatrixList();
        break;
      case 4:
        print("====>Show MatrixMap<====");
        showMatrixMap();
        break;
      case 5:
        print("====>Show JsonMap<====");
        showJsonMap();
        break;
      case 6:
        print("====>Show SortDescInArray<====");
        showSortInArray(matrixList, "desc");
        break;
      case 7:
        print("====>Show SortAscInArray<====");
        showSortInArray(matrixList, "asc");
        break;
      case 8:
        print("====>Show SearchInArray<====");
        showSearchInArray(matrixList, "searchElement", 125);
        break;
      case 9:
        print("====>Show BinarySearchInArray<====");
        showSearchInArray(matrixList, "binarySearchElement", 56);
        break;
      case 0:
        exit(0);
        break;
    }
  } while (luachonMenu >= 0 && luachonMenu < 10);
}

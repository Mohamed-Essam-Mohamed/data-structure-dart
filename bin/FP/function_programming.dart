// Book Library System using Functions (Not strict FP)

//1 ========== MODELS ==========

import 'dart:io';

typedef Book = Map<String, dynamic>;
typedef Reader = Map<String, dynamic>;
typedef BorrowedBook = Map<String, dynamic>;

// ========== SAMPLE DATA ==========

List<Book> books = [
  {'id': 1, 'title': 'Clean Code', 'author': 'Robert C. Martin', 'isAvailable': true},
  {
    'id': 2,
    'title': 'The Pragmatic Programmer',
    'author': 'Andrew Hunt',
    'isAvailable': true
  },
];

List<Reader> readers = [
  {'id': 1, 'name': 'Mohamed Esam'},
];

List<BorrowedBook> borrowedBooks = [];

//! ========== FUNCTIONS ==========

Book createBook(int id, String title, String author) {
  return {
    'id': id,
    'title': title,
    'author': author,
    'isAvailable': true,
  };
}

Reader createReader(int id, String name) {
  return {
    'id': id,
    'name': name,
  };
}

List<Book> addBook(List<Book> bookList, Book newBook) {
  bookList.add(newBook);
  return bookList;
}

List<Book> deleteBook(List<Book> bookList, int bookId) {
  bookList.removeWhere((book) => book['id'] == bookId);
  return bookList;
}

List<Reader> addReader(List<Reader> readerList, Reader newReader) {
  readerList.add(newReader);
  return readerList;
}

List<Book> borrowBook(List<Book> bookList, int bookId) {
  for (var book in bookList) {
    if (book['id'] == bookId && book['isAvailable'] == true) {
      book['isAvailable'] = false;
    }
  }
  return bookList;
}

List<Book> returnBook(List<Book> bookList, int bookId) {
  for (var book in bookList) {
    if (book['id'] == bookId) {
      book['isAvailable'] = true;
    }
  }
  return bookList;
}

List<BorrowedBook> addBorrowedBook(List<BorrowedBook> list, int readerId, int bookId) {
  list.add({
    'readerId': readerId,
    'bookId': bookId,
    'borrowDate': DateTime.now().toIso8601String(),
    'returnDate': null,
  });
  return list;
}

List<BorrowedBook> returnBorrowedBook(List<BorrowedBook> list, int bookId) {
  for (var entry in list) {
    if (entry['bookId'] == bookId && entry['returnDate'] == null) {
      entry['returnDate'] = DateTime.now().toIso8601String();
    }
  }
  return list;
}

List<Book> getAvailableBooks(List<Book> bookList) {
  return bookList.where((book) => book['isAvailable'] == true).toList();
}

List<Book> getBorrowedBooks(List<Book> bookList) {
  return bookList.where((book) => book['isAvailable'] == false).toList();
}

List<Book> getReaderBooks(
    List<BorrowedBook> borrowList, List<Book> bookList, int readerId) {
  List<int> borrowedIds = borrowList
      .where((b) => b['readerId'] == readerId && b['returnDate'] == null)
      .map((b) => b['bookId'] as int)
      .toList();

  return bookList.where((book) => borrowedIds.contains(book['id'])).toList();
}

//! ========== USAGE EXAMPLE ==========

void main() {
  while (true) {
    print('\n===== Library Menu =====');
    print('1. Add Book');
    print('2. Delete Book');
    print('3. Add Reader');
    print('4. Borrow Book');
    print('5. Return Book');
    print('6. Show Available Books');
    print('7. Show Borrowed Books');
    print("8. Show Reader's Books");
    print('9. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter Book ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Book Title: ');
        String title = stdin.readLineSync()!;
        stdout.write('Enter Book Author: ');
        String author = stdin.readLineSync()!;
        books = addBook(books, createBook(id, title, author));
        print(' Book added.');
        break;

      case '2':
        stdout.write('Enter Book ID to delete: ');
        int id = int.parse(stdin.readLineSync()!);
        books = deleteBook(books, id);
        print(' Book deleted.');
        break;

      case '3':
        stdout.write('Enter Reader ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Reader Name: ');
        String name = stdin.readLineSync()!;
        readers = addReader(readers, createReader(id, name));
        print(' Reader added.');
        break;

      case '4':
        stdout.write('Enter Book ID to borrow: ');
        int bookId = int.parse(stdin.readLineSync()!);
        stdout.write('Enter Reader ID: ');
        int readerId = int.parse(stdin.readLineSync()!);
        books = borrowBook(books, bookId);
        borrowedBooks = addBorrowedBook(borrowedBooks, readerId, bookId);
        print(' Book borrowed.');
        break;

      case '5':
        stdout.write('Enter Book ID to return: ');
        int bookId = int.parse(stdin.readLineSync()!);
        books = returnBook(books, bookId);
        borrowedBooks = returnBorrowedBook(borrowedBooks, bookId);
        print(' Book returned.');
        break;

      case '6':
        print(' Available Books:');
        getAvailableBooks(books).forEach(print);
        break;

      case '7':
        print(' Borrowed Books:');
        getBorrowedBooks(books).forEach(print);
        break;

      case '8':
        stdout.write('Enter Reader ID: ');
        int readerId = int.parse(stdin.readLineSync()!);
        print(' Books borrowed by reader:');
        getReaderBooks(borrowedBooks, books, readerId).forEach(print);
        break;

      case '9':
        print(' Goodbye!');
        return;

      default:
        print(' Invalid choice. Please try again.');
        break;
    }
  }
}

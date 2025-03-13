class Car {
  String brand;
  String model;

  Car(this.brand, this.model);

  void displayDetails() {
    print('Brand: $brand, Model: $model');
  }
}

void main() {
  Car car1 = Car('Toyota', 'Corolla');
  car1.displayDetails();

  Car car2 = Car('Honda', 'Accord');
  car2.displayDetails();

  Book book1 = Book('When Action Follows Heart', 'Isah');
  book1.displayDetails();

  Book book2 = Book('The Gift of Impecfection', 'Ahmed');
  book2.displayDetails();
}

class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayDetails() {
    print('Title: $title, Author: $author');
  }
}

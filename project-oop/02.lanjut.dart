import 'dart:io';

class Address {
  String city;
  String country;
  Address(this.city, this.country);
}

abstract class Person {
  String nama;
  int umur;
  Address address; 

  Person(this.nama, this.umur, this.address);

  String introduce();
}

class Child extends Person {
  Child(String nama, int umur, Address address) : super(nama, umur, address);
  @override
  String introduce() => "Hai, saya $nama, anak-anak umur $umur tahun dari ${address.city}.";
}

class Teenager extends Person {
  Teenager(String nama, int umur, Address address) : super(nama, umur, address);
  @override
  String introduce() => "Halo, saya $nama, remaja umur $umur tahun dari ${address.city}.";
}

class Adult extends Person {
  Job job;
  Adult(String nama, int umur, Address address, this.job) : super(nama, umur, address);
  
  @override
  String introduce() => "Hai, saya $nama, umur $umur tahun dari ${address.city}, bekerja sebagai ${job.title}.";
}

class Job {
  String title;
  Job(this.title);
}

void main() {
  print("Input nama:");
  String nama = stdin.readLineSync() ?? "";
  print("Input umur:");
  int umur = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  if (nama.isEmpty || umur <= 0) {
    print("Input tidak valid!");
    return;
  }

  Address address = Address("Jakarta", "Indonesia");
  Job job = Job("Software Engineer");

  Person person = umur < 12
      ? Child(nama, umur, address)
      : umur < 18
          ? Teenager(nama, umur, address)
          : Adult(nama, umur, address, job);

  print(person.introduce());
}

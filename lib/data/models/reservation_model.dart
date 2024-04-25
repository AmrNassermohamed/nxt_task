class ReservationModel {
  List<Reservations>? reservations;

  ReservationModel({this.reservations});

  ReservationModel.fromJson(Map<String, dynamic> json) {
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(Reservations.fromJson(v));
      });
    }
  }
}

class Reservations {
  int? id;
  String? startDate;
  String? endDate;
  List<Stays>? stays;
  List<UserTickets>? userTickets;

  Reservations(
      {this.id, this.startDate, this.endDate, this.stays, this.userTickets});

  Reservations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    if (json['stays'] != null) {
      stays = <Stays>[];
      json['stays'].forEach((v) {
        stays!.add(Stays.fromJson(v));
      });
    }
    if (json['user_tickets'] != null) {
      userTickets = <UserTickets>[];
      json['user_tickets'].forEach((v) {
        userTickets!.add(UserTickets.fromJson(v));
      });
    }else{
      userTickets=[];
    }
  }
}

class Stays {
  String? name;
  String? description;
  String? lat;
  String? lng;
  String? address;
  String? checkIn;
  bool  isOpened=false;
  String? checkOut;
  int? stars;
  List<String>? stayImages;
  String? amenities;
  List<Rooms>? rooms;

  Stays(
      {this.name,
        this.description,
        this.lat,
        this.lng,
        this.address,
        this.checkIn,
        this.checkOut,
        this.stars,
        this.stayImages,
        this.amenities,
        this.rooms});

  Stays.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    lat = json['lat'];
    lng = json['lng'];
    address = json['address'];
    checkIn = json['check_in'];
    isOpened=false;
    checkOut = json['check_out'];
    stars = json['stars'];
    stayImages = json['stay_images'].cast<String>();
    amenities = json['amenities'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(Rooms.fromJson(v));
      });
    }
  }


}

class Rooms {
  String? roomNumber;
  int? roomCapacity;
  String? roomTypeName;
  String? stayName;
  List<Guests>? guests;

  Rooms(
      {this.roomNumber,
        this.roomCapacity,
        this.roomTypeName,
        this.stayName,
        this.guests});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomNumber = json['room_number'];
    roomCapacity = json['room_capacity'];
    roomTypeName = json['room_type_name'];
    stayName = json['stay_name'];
    if (json['guests'] != null) {
      guests = <Guests>[];
      json['guests'].forEach((v) {
        guests!.add(Guests.fromJson(v));
      });
    }
  }


}

class Guests {
  String? firstName;
  String? lastName;
  String? avatar;

  Guests({this.firstName, this.lastName, this.avatar});

  Guests.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }


}

class UserTickets {
  int? ticketId;
  String? seat;
  String? ticketSystemId;
  String? ticketTypeName;
  TicketUserData? ticketUserData;
  String? gate;

  UserTickets(
      {this.ticketId,
        this.seat,
        this.ticketSystemId,
        this.ticketTypeName,
        this.ticketUserData,
        this.gate});

  UserTickets.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    seat = json['seat'];
    ticketSystemId = json['ticket_system_id'];
    ticketTypeName = json['ticket_type_name'];
    ticketUserData = json['ticket_user_data'] != null
        ? TicketUserData.fromJson(json['ticket_user_data'])
        : null;
    gate = json['gate'];
  }


}

class TicketUserData {
  String? firstName;
  String? lastName;
  String? avatar;
  bool? isUser;

  TicketUserData({this.firstName, this.lastName, this.avatar, this.isUser});

  TicketUserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    isUser = json['is_user'];
  }


}
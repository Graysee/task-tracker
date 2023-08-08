class Tasks {
 final String? id;
 final String? title;
 final String? deadline;
 final int? halfYear;
 final String? documentId;


  Tasks(
      {this.id,
      this.title,
      this.deadline,
      this.halfYear,
        this.documentId
      });



  static Tasks fromJson(Map<String, dynamic> json, String documentId){
    return Tasks(
    id : json['id'],
    title : json['title'],
    deadline : json['deadline'],
    halfYear : json['halfYear'],
    documentId:documentId,
    );
  }



  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['title'] = title;
    data['deadline'] = deadline;
    data['halfyear'] = halfYear;

    return data;
  }


}

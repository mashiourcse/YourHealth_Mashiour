class Appointment {
  final String patientName;
  final String doctorName;
  final String date;
  final String time;
  final String message;
  final String appointmentId;
  final String patientId;
  final String doctorId;

  Appointment(
      {this.patientId,
      this.doctorId,
      this.appointmentId,
      this.patientName,
      this.doctorName,
      this.date,
      this.time,
      this.message});
}

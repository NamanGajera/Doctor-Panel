enum RouterName {
  mainLayout('/', "mainLayout"),
  login('/login', "login"),
  completeProfile('/completeProfile', "completeProfile"),
  dashboardPage('/dashboardPage', "dashboardPage"),
  appointmentPage('/appointmentPage', "appointmentPage"),
  calendarPage('/calendarPage', "calendarPage"),
  chatPage('/chatPage', "chatPage"),
  helpSupportPage('/helpSupportPage', "helpSupportPage"),
  patientPage('/patientPage', "patientPage"),
  prescriptionPage('/prescriptionPage', "prescriptionPage"),
  settingPage('/settingPage', "settingPage");

  final String path;
  final String name;

  const RouterName(this.path, this.name);
}

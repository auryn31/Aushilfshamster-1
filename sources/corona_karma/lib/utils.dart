String getHelperTextFromIcon(String icon) {
  switch (icon) {
    case "dog":
      return "will für dich deinen Hund ausführen.";
    case "pills":
      return "möchte dir beim Medikamente abholen helfen.";
    case "groceries":
      return "möchte für dich einkaufen gehen.";
    case "postal":
      return "will für dich zur Post gehen.";
    default:
      return "will dir helfen.";
  }
}

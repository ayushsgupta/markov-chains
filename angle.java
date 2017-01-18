class angle {
  public static void main(String [] args) {
    System.out.println(angle_calc(10, 20));
  }

  public static double angle_calc(double distance, double velocity) {
    double g = 32.125D;
    double arc_two_theta = (distance * g) / (Math.pow(velocity,2));
    double theta = Math.asin(arc_two_theta) / 2;
    theta = (theta * 180) / 3.14159265;
    return theta;
  }
}

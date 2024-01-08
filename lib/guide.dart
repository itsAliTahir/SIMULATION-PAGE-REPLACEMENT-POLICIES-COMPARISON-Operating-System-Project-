import 'package:flutter/material.dart';

class MyGuide extends StatefulWidget {
  const MyGuide({super.key});

  @override
  State<MyGuide> createState() => _MyGuideState();
}

class _MyGuideState extends State<MyGuide> {
  Widget heading(String content) {
    return Text(
      content,
      style: TextStyle(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontWeight: FontWeight.bold,
          fontFamily: "WorkSans",
          fontSize: 20),
    );
  }

  Widget subHeading(String content) {
    return Text(
      content,
      style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "WorkSans",
          fontSize: 18),
    );
  }

  Widget content(String content) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: const TextStyle(color: Color.fromARGB(255, 68, 68, 68)),
    );
  }

  Widget image(String content, double height, double width) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(content),
      ),
    );
  }

  Widget gap() {
    return const SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heading("Overview"),
          content(
              "This web project appears to be a dynamic and interactive demonstration of three different page replacement algorithms: Least Recently Used (LRU), Last In, First Out (LIFO), and First In, First Out (FIFO). This project seems to provide users with the ability to input custom parameters, such as the sequence of page requests or the number of pages in the system, and then visualizes the step-by-step execution of each page replacement algorithm."),
          gap(),
          heading("How to Use"),
          subHeading("Initial Input:"),
          content(
              "Begin by opening the web application, where you'll encounter the first screen. Here, you'll find two input fields: \"Number of Frames\" and \"Number of Pages.\" Input your desired values, then proceed to the next screen."),
          gap(),
          image("assets/1.png", 150, 300),
          gap(),
          subHeading("Page Input:"),
          content(
              "On the second screen, you'll encounter an input field labeled \"Enter Page IDs\" corresponding to the number of pages you entered earlier. Remember, you can't leave any page ID blank to proceed. Additionally, there is an \"Auto Generate\" button available; clicking on it will randomly generate IDs for all pages. Input page IDs manually or use the auto-generate feature, and then click \"Next\" to move to the algorithm selection screen."),
          gap(),
          image("assets/2.png", 150, 300),
          gap(),
          subHeading("Algorithm Selection:"),
          content(
              "The third screen presents three buttons labeled \"FIFO,\" \"LIFO,\" and \"LRU,\" representing different page replacement algorithms. Hover over each button to read a brief description, then click on your preferred algorithm. You will be redirected to the respective algorithm screen."),
          gap(),
          subHeading("Algorithm Screen:"),
          content("On the algorithm screen, you'll find three options:"),
          gap(),
          content(
              "• Animate: Click to start or pause the animation. After completion, the button changes to \"Restart\" for replay."),
          content(
              "• Reset: Use this button to reset all fields and start fresh at any point."),
          content(
              "• Step Forward Arrow: Progress through the algorithm manually without animation, useful for a detailed step-by-step view."),
          gap(),
          heading("Using the Algorithm"),
          content(
              "Observe how the algorithm makes page replacement decisions based on your inputs. If you chose animation, watch the process unfold. Alternatively, use the \"Step Forward Arrow\" or \"Reset\" button as needed. After completion, the total number of page faults will be displayed, providing insight into the algorithm's efficiency. You can then select another algorithm or return to the algorithm selection screen."),
          gap(),
          heading("Working of Algorithm"),
          content(
              "The algorithm operates by considering the availability of space in memory for new pages. Here's a breakdown of its functionality:"),
          gap(),
          subHeading("Space Availability:"),
          content(
              "If there is available space in memory, the algorithm allocates the new page to that space."),
          gap(),
          image("assets/3.png", 300, 500),
          gap(),
          subHeading("Memory Full:"),
          content(
              "In cases where memory is already occupied, the algorithm follows the page replacement strategy based on the selected algorithm. It removes a page from memory according to the specified algorithm to create room for the incoming page."),
          gap(),
          image("assets/4.png", 300, 500),
          gap(),
          subHeading("Page Replacement:"),
          content(
              "The algorithm replaces the selected page with the new one in the available memory space."),
          gap(),
          image("assets/5.png", 300, 500),
          gap(),
          subHeading("Blinking Effect:"),
          content(
              "If the upcoming page to be replaced is already allocated in memory, it is visually highlighted with a blinking effect. The page is temporarily displayed in a dark blue color to draw attention to the replacement process."),
          gap(),
          image("assets/6.png", 300, 500),
          gap(),
          content(
              "This process continues dynamically as the algorithm iterates through the sequence of page requests, managing the allocation and replacement of pages in memory. The visual cues, such as the blinking effect, provide users with a clear indication of the algorithm's decision-making and help in understanding the dynamics of page replacement."),
          gap(),
          image("assets/7.png", 300, 500),
          gap(),
        ],
      ),
    );
  }
}

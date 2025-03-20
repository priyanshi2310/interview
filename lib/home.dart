import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> reminders = [
    "Coffee",
    "Appointment",
    "For Birthday Party",
    "For Entry Code",
    "Coffee Cafe Day",
    "Meeting at Office",
    "Doctor's Appointment",
  ];
  List<String> filteredReminders = [];

  TextEditingController searchController = TextEditingController();

  bool isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    filteredReminders = reminders;
    searchController.addListener(_filterReminders);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _filterReminders() {
    setState(() {
      if (searchController.text.isEmpty) {
        filteredReminders = reminders;
        isDropdownVisible = false;
      } else {
        filteredReminders =
            reminders
                .where(
                  (reminder) => reminder.toLowerCase().contains(
                    searchController.text.toLowerCase(),
                  ),
                )
                .toList();
        isDropdownVisible = true;
      }
    });
  }

  void _onItemSelected(String selectedItem) {
    searchController.text = selectedItem;
    setState(() {
      isDropdownVisible = false;
    });
  }

  List<String> text1 = [
    "Coffee",
    "Appoinment",
    "For Birthday Party",
    "For entry code",
    "Coffe Cafe day",
    "Appoinment",
  ];

  List<String> text2 = [
    "Coffe is good nature by day it is called good wibe for",
    "Appoinment is neccsary for coming",
    "For entry code come pepole",
    "Coffe Cafe day is very crowdy",
    "Appoinment is good",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 72, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reminders',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Image.asset('images/avatar (1).png', scale: 1.9),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (searchController.text.isNotEmpty) {
                    isDropdownVisible = true;
                  }
                });
              },
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search your Reminder',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  prefixIcon: Icon(Icons.search, color: Colors.blueGrey),
                  fillColor: Color(0xffF7F7F7),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            if (isDropdownVisible)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Column(
                  children:
                      filteredReminders.map((reminder) {
                        return ListTile(
                          title: Text(reminder),
                          onTap: () => _onItemSelected(reminder),
                        );
                      }).toList(),
                ),
              ),

            SizedBox(height: 20),
            Text(
              'Pinned',
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Color(0xffC3C3C3),
              ),
            ),
            SizedBox(height: 172),
            Text(
              'General',
              style: TextStyle(
                fontSize: 26,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: Color(0xffC3C3C3),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildReminderCard(index, 140, 170, Color(0xffEEAF47)),
                        buildReminderCard(index, 190, 170, Color(0xffFFA868)),
                      ],
                    );
                  } else if (index == 1) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildReminderCard(index, 190, 170, Color(0xffEEAF47)),
                        buildReminderCard(index, 140, 170, Color(0xffFFA868)),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildReminderCard(index, 140, 170, Color(0xffEEAF47)),
                        buildReminderCard(index, 190, 170, Color(0xffFFA868)),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReminderCard(
    int index,
    double height,
    double width,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 3,
            text1[index],
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
          ),
          Text(
            text2[index],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}

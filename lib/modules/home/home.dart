import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:smart_spending/modules/home/lineChart.dart';
import 'package:smart_spending/modules/home/pricePoints.dart';
import 'package:smart_spending/modules/models/Transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(255, 246, 229, 1),
        ),
        body: const SingleChildScrollView(
          child: BodyContainer(),
        ));
  }
}

class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const headerRowPadding = EdgeInsets.fromLTRB(16, 8, 16, 8);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
      child: Container(
        padding: EdgeInsets.only(
          bottom: 0.02 * MediaQuery.of(context).size.width,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 246, 229, 1.0),
                Color.fromRGBO(248, 237, 216, 0.0)
              ]),
        ),
        child: Column(
          children: <Widget>[
            const Padding(padding: headerRowPadding, child: Header()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Account Balance',
                    style: TextStyle(
                        fontSize: 0.04 * MediaQuery.of(context).size.width,
                        fontFamily: 'Inter',
                        color: const Color.fromRGBO(145, 145, 159, 1),
                        fontWeight: FontWeight.w500)),
              ],
            ),
            const AccountBalance(),
            const ExpensesIncomeRow()
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatelessWidget {
  const DropDownList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          items: <String>[
            'October',
            'September',
            'December',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {},
          value: 'October',
          style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14.0,
              color: Color.fromRGBO(33, 35, 37, 1),
              fontWeight: FontWeight.w500),
          underline: const SizedBox(),
          icon: SvgPicture.asset(
            'assets/icons/arrow-down-2.svg',
            width: 24.0,
            height: 24.0,
          ),
          dropdownColor: const Color.fromRGBO(241, 241, 250, 1),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(255, 246, 229, 1);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromRGBO(173, 0, 255, 1), width: 1.0),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 30.0,
            )),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 0.02 * MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                color: const Color.fromRGBO(241, 241, 250, 1), width: 1.0),
            color: backgroundColor,
          ),
          child: const DropDownList(),
        ),
        Container(
          padding: EdgeInsets.all(0.02 * MediaQuery.of(context).size.width),
          child: SvgPicture.asset(
            'assets/icons/notification.svg',
            width: 32.0,
            height: 32.0,
          ),
        ),
      ],
    );
  }
}

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$9400',
            style: TextStyle(
              color: Color.fromRGBO(22, 23, 25, 1),
              fontFamily: 'Inter',
              fontSize: 40.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class ExpensesIncomeRow extends StatelessWidget {
  const ExpensesIncomeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.02 * MediaQuery.of(context).size.width),
      padding: EdgeInsets.only(
          left: 0.02 * MediaQuery.of(context).size.width,
          right: 0.02 * MediaQuery.of(context).size.width),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Income(),
          SizedBox(
            width: 0.02 * MediaQuery.of(context).size.width,
          ),
          const Expenses(),
        ],
      ),
    );
  }
}

class Income extends StatelessWidget {
  const Income({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const incomesColor = Color.fromRGBO(0, 168, 107, 1);
    return Expanded(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.0),
          child: Container(
              padding: EdgeInsets.all(0.04 * MediaQuery.of(context).size.width),
              alignment: Alignment.center,
              color: incomesColor,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/icons/income.svg',
                          width: 32.0,
                          height: 32.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 0.02 * MediaQuery.of(context).size.width),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Income',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize:
                                  0.04 * MediaQuery.of(context).size.width,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '\$500',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize:
                                  0.06 * MediaQuery.of(context).size.width,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const expensesColor = Color.fromRGBO(253, 60, 74, 1);
    return Expanded(
        flex: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.0),
          child: Container(
              padding: EdgeInsets.all(0.04 * MediaQuery.of(context).size.width),
              alignment: Alignment.center,
              color: expensesColor,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(
                            0.04 * MediaQuery.of(context).size.width),
                        color: Colors.white,
                        child: SvgPicture.asset(
                          'assets/icons/expense.svg',
                          width: 32.0,
                          height: 32.0,
                        ),
                      ),
                    ),
                    SizedBox(width: 0.02 * MediaQuery.of(context).size.width),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Expenses',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize:
                                    0.04 * MediaQuery.of(context).size.width,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$500',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize:
                                      0.06 * MediaQuery.of(context).size.width,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}

class Frequecy extends StatelessWidget {
  const Frequecy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
            padding:
                EdgeInsets.only(left: 0.02 * MediaQuery.of(context).size.width),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'Spend Frequency',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 0.06 * MediaQuery.of(context).size.width,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ]))
      ]),
    );
  }
}

class BodyContainer extends StatelessWidget {
  const BodyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction(
          id: 1,
          amount: 433.0,
          title: 'Groceries',
          date: DateTime(2023, 08, 28)),
      Transaction(
          id: 2, amount: 213.0, title: 'Gas', date: DateTime(2023, 08, 29)),
      Transaction(
          id: 3, amount: 120.0, title: 'Dinner', date: DateTime(2023, 08, 27)),
      Transaction(
          id: 4,
          amount: 433.0,
          title: 'Shopping',
          date: DateTime(2023, 08, 26)),
    ];
    return Container(
      padding: const EdgeInsets.only(bottom: 94.0),
      child: Column(
        children: [
          const OverView(),
          const Frequecy(),
          const FrequencyChart(),
          const FiltersRow(),
          const RecentTransactionsHeader(),
          Container(
            height: 100.0,
            child: ListOfTransactions(
              transactions: transactions,
            ),
          )
        ],
      ),
    );
  }
}

class FrequencyChart extends StatelessWidget {
  const FrequencyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.04 * MediaQuery.of(context).size.width),
      child: LineChartWidget(pricePoints),
    );
  }
}

class RecentTransactionsHeader extends StatelessWidget {
  const RecentTransactionsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          margin:
              EdgeInsets.only(top: 0.02 * MediaQuery.of(context).size.width),
          padding:
              EdgeInsets.only(left: 0.02 * MediaQuery.of(context).size.width),
          child: Text(
            'Recent Transactions',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 0.04 * MediaQuery.of(context).size.width,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }
}

class FiltersRow extends StatefulWidget {
  const FiltersRow({Key? key}) : super(key: key);

  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FiltersRow> {
  String selectedFilter = 'Today';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFilterButton('Today'),
          _buildFilterButton('Week'),
          _buildFilterButton('Month'),
          _buildFilterButton('Year'),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filter) {
    final isSelected = selectedFilter == filter;
    const seclectedBgColor = Color.fromRGBO(252, 238, 212, 1);
    const seclectedTextColor = Color.fromRGBO(252, 172, 18, 1);

    return ElevatedButton(
        onPressed: () => {
              setState(() {
                selectedFilter = filter;
              })
            },
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          backgroundColor: isSelected ? seclectedBgColor : Colors.white,
          elevation: 0.0,
        ),
        child: Text(
          filter,
          style: TextStyle(
              color: isSelected
                  ? seclectedTextColor
                  : const Color.fromRGBO(145, 145, 159, 1),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
        ));
  }
}

class TransactionRow extends StatelessWidget {
  final Transaction transaction;

  const TransactionRow({super.key, required this.transaction});
  @override
  Widget build(BuildContext context) {
    String locale = Localizations.localeOf(context).languageCode;

    return Container(
      padding: EdgeInsets.all(0.04 * MediaQuery.of(context).size.width),
      margin: EdgeInsets.all(0.04 * MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(252, 252, 252, 1),
          borderRadius: BorderRadius.circular(24.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(252, 238, 212, 1),
                    borderRadius: BorderRadius.circular(16.0)),
                padding:
                    EdgeInsets.all(0.04 * MediaQuery.of(context).size.width),
                child: SvgPicture.asset('assets/icons/shopping-bag.svg'),
              ),
              SizedBox(
                width: 0.04 * MediaQuery.of(context).size.width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                        color: Color.fromRGBO(41, 43, 45, 1)),
                  ),
                  SizedBox(
                    height: 0.03 * MediaQuery.of(context).size.width,
                  ),
                  const Text('Buy some grocery',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.0,
                          color: Color.fromRGBO(145, 145, 159, 1))),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('-\$${transaction.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color.fromRGBO(253, 60, 74, 1))),
              SizedBox(
                height: 0.03 * MediaQuery.of(context).size.width,
              ),
              Text(
                  intl.DateFormat.Hm(locale)
                      .format(transaction.date)
                      .toString(),
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                      color: Color.fromRGBO(145, 145, 159, 1))),
            ],
          )
        ],
      ),
    );
  }
}

class ListOfTransactions extends StatelessWidget {
  final List<Transaction> transactions;

  const ListOfTransactions({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionRow(transaction: transaction);
          },
        ))
      ],
    );
  }
}

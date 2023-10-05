import 'package:flutter/material.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Change',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            const Text('**** **** **** 2718'),
          ],
        ),
      ],
    );
  }
}

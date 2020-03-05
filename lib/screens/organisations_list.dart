import 'package:appcup/models/user.dart';
import 'package:appcup/screens/organisation_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganisationsList extends StatefulWidget {
  @override
  _OrganisationsListState createState() => _OrganisationsListState();
}

class _OrganisationsListState extends State<OrganisationsList> {
  @override
  Widget build(BuildContext context) {

    final organisations = Provider.of<List<OrganisationUserData>>(context) ?? [];

    return ListView.builder(
      itemCount: organisations.length,
      itemBuilder: (context, index) {
        return OrganisationTile(organisation: organisations[index]);
      },
    );
  }
}
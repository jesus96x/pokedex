import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/widgets/background.dart';
import 'package:textfield_search/textfield_search.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String dropdownvalue = "pokemon";
  List<_SearchFields> items = [
    _SearchFields('pokemon', Icons.sports_baseball_rounded),
    _SearchFields('moves', Icons.disc_full_rounded),
    _SearchFields('abilities', Icons.sports_handball),
    _SearchFields('item', Icons.fastfood_rounded),
    _SearchFields("berry", Icons.apple),
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    //const dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
    return SafeArea(
      child: Scaffold(
        body: HomeBackground(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
            width: double.infinity,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("JD Pokedex", style: AppTheme.theme.textTheme.headline1,),
                        Text("What are you looking for?", style: AppTheme.theme.textTheme.headline1,),
                      ],
                    ),
                  ),
                  SizedBox(height: 78,),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxHeight: 60,
                        maxWidth: 160
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: AppTheme.primary)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: AppTheme.primary)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: AppTheme.primary)
                      ),
                      hintText: "Choose search category",
                      labelText: "Choose search category",
                      hintStyle: TextStyle(
                        color: AppTheme.secondary,
                      ),
                      labelStyle: TextStyle(
                        color: AppTheme.secondary,
                      ),
                    ),
                    value: "pokemon",
                    items: items.map((_SearchFields items) {
                      return DropdownMenuItem(
                        value: items.name,
                        child: Row(children: [Icon(items.icon), SizedBox(width: 6), Text(items.name)],),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 15,),
                  TextFieldSearch(
                    decoration: _InputDeco.Decoration(),
                    initialList: [],
                    label: "Search Pokemon, Moves, Abilities, etc...",
                    controller: myController,
                  ),

                  SizedBox(height: 10,),

                  _FeatureButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchFields
{
  final String name;
  final IconData icon;

  _SearchFields(this.name, this.icon);


}

class _FeatureButtons extends StatelessWidget {
  const _FeatureButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _StyledButton(
                text: "Pokedex",
                image_path: "assets/images/master.png",
                color: Color.fromRGBO(79, 193, 166, 1)
            ),
            SizedBox(width: 6,),
            _StyledButton(
                text: "Moves",
                image_path: "assets/images/ultra.png",
                color: Color.fromRGBO(247, 119, 106, 1)
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            _StyledButton(
                text: "Abilities",
                image_path: "assets/images/poke3.png",
                color: Color.fromRGBO(88, 169, 244, 1)
            ),
            SizedBox(width: 6,),
            _StyledButton(
                text: "Items",
                image_path: "assets/images/poke2.png",
                color: Color.fromRGBO(255, 206, 75, 1)
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            _StyledButton(
                text: "Locations",
                image_path: "assets/images/poke4.png",
                color: Color.fromRGBO(124, 82, 140, 1)
            ),
            SizedBox(width: 6,),
            _StyledButton(
                text: "Type Charts",
                image_path: "assets/images/poke5.png",
                color: Color.fromRGBO(176, 115, 109, 1)
            ),
          ],
        ),
      ],
    );
  }
}

class _StyledButton extends StatelessWidget {
  final String image_path;
  final Color color;
  final String text;
  const _StyledButton({Key? key, required this.text, required this.image_path, required this.color, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: () {}, // Handle your callback.
      splashColor: Colors.red.withOpacity(0.5),
      child: Ink(
        padding: const EdgeInsets.all(7),
        height: 80,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: color,
          image: DecorationImage(
            alignment: Alignment.centerRight,
            image: AssetImage(image_path),
            fit: BoxFit.contain,
          ),
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(text, style: TextStyle(fontSize: 20, fontFamily: "Pokemon", letterSpacing: 3.0 ),)
        ),
      ),
    )
    );
  }
}



class _InputDeco
{
  static InputDecoration Decoration()
  {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: AppTheme.primary)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppTheme.primary)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppTheme.primary)
      ),
      prefixIcon: Icon(Icons.search, color: AppTheme.primary,),
      hintText: "Search Pokemon, Moves, Abilities, etc...",
      labelText: "Search Pokemon, Moves, Abilities, etc...",
      hintStyle: TextStyle(
        color: AppTheme.secondary,
      ),
      labelStyle: TextStyle(
        color: AppTheme.secondary,
      ),
    );
  }
}
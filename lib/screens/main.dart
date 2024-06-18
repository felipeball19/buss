


import'package:flutter/material.dart';
import 'bus.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final String correctPassword = "1005339021";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese la contraseña:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            PasswordForm(correctPassword: correctPassword),
          ],
        ),
      ),
    );
  }
}

class PasswordForm extends StatefulWidget {
  final String correctPassword;

  const PasswordForm({required this.correctPassword});

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Contraseña',
            errorText: _passwordError ? 'Contraseña incorrecta' : null,
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (_passwordController.text == widget.correctPassword) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BusInfoScreen()),
              );
            } else {
              setState(() {
                _passwordError = true;
              });
            }
          },
          child: Text('Iniciar Sesión'),
        ),
      ],
    );
  }
}

class BusInfoScreen extends StatefulWidget {
  final List<Bus> buses = [
    Bus(
  "Cotrander",
  "Ruta A",
  "assets/bus1.jpg",
  [
    "BUENAVISTA (INCIO)",
    "MORRO",
    "ÁLVAREZ",
    "CARRERA 33",
    "CCCACIQUE",
    "DIAMANTEII",
    "PROVENZA",
    "CRISTAL BAJO (FIN)",
    "MODELO (INCIO)",
    "CENTRO",
    "UIS",
    "CALLE 34",
    "ABASTOS",
    "MODELO",
    "CENTRO",
    "CARRERA 19",
    "CALLE 8 (FIN)",
    "Calle 200(INICIO)",
    "Papi quiero pina",
    "autopist Floridablanca",
    "Centro comercial Caracoli",
    "Puente Provenza",
    "Centro comercial cacique",
    "Carrera 33",
    "Megamall",
    "Estadio Alfonso Lopez",
    "Estacion UIS",
    "Universidad de Investigacion y desarrollo",
    "Universidad Santo Tomas (FIN)",
  ],
  "VALOR DEL PASAJE 2000",
),
Bus(
  "Lusitania",
  "Ruta B",
  "assets/bus2.jpg",
  [
    "MORRO (INICIO)",
    "ÁLVAREZ",
    "CARRERA 33",
    "CCCACIQUE",
    "DIAMANTEII",
    "PROVENZA",
    "CRISTAL BAJO (FIN)",
    "CARACOLÍ (INICIO)",
   "TRANSVERSAL ORIENTAL",
   "HIPINTO", 
   "CARRERA 21",
   "CENTRO (FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),

 Bus(
  "Trans Giron",
  "Ruta C",
  "assets/bus3.jpg",
  [
    "BUENAVISTA (INICIO)",
    "MORRO",
    "ÁLVAREZ",
    "CARRERA 33",
    "CCCACIQUE",
    "DIAMANTEII",
    "PROVENZA",
    "CRISTAL BAJO (FIN)",
    "BAHONDO (INICIO)",
    "POBLADO",
    "CARRERA 33",
    "UIS (FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),

Bus(
  "Villa San Carlos",
  "Ruta D",
  "assets/bus4.jpg",
  [
    "KM3 las plamas (INICIO)",
    "Parque principal de Piedecuesta",
    "Puente Cabecera del llano",
    "Universidad Pontificia Bolivariana",
    "Floridablanca",
    "Jardin Botanico Eloy Valenzuela",
    "Plaza satelite carretera antigua",
    "Centro comercial cacique"
    "carrera 33",
    "Avenida Quebradaseca",
    "Megamall (FIN)",
    
  ],
  "VALOR DEL PASAJE 2700",
),

Bus(
  "Unitransa",
  "Ruta E",
  "assets/bus5.jpg",
  [
    "Modelo(INICIO)",
    "centro",
    "UIS",
    "Abastos (FIN)",
    "Morrorico (INICIO)",
    "Canelos",
    "Terminal",
    "INEM(FIN)",
    "Joya(INICIO)",
    "UIS",
    "CARRERA 33",
    "La victoria (FIN)",
    "Real de minas (INICIO)",
    "cr 33",
    "Mutis",
    "Don Bosco (FIN)",
    "Carrizal (INICIO)",
    "cabecera",
    "Porton del mar (FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),

Bus(
  "Oriental",
  "Ruta F",
  "assets/bus6.jpg",
  [
    "Brisas del campo (INICIO)",
    "villa san juan",
    "Caneyes",
    "CRincon de Giron",
    "Puente el Bueno",
    "Transversal Metropolitana",
    "PBoulevard Santander",
    "CGlorieta carrera 30",
    "Boulevard Santander",
    "Diagonal 15",
    "Carrera 17",
    "Calle 61(FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),
    
Bus(
  "Trans Colombia",
  "Ruta G",
  "assets/bus7.jpg",
  [
    "El Pablón , Colorados , Café Madrid , Kennedy , Hospital Local del Norte , Miramar , Portal Norte Ciudad Jardín , Vía Bucaramanga , Carrera 15 , Calle 11 , Parque Estación UIS , Calle 10 , Carrera 24 , Calle 14 ,Carrera 30 , Avenida Quebradaseca , Carrera 33 , Calle 56 , Plaza Mayor , Calle 55 , Marsella Real , Calle 56 , Carrera 8W , Calle 60 , Estoraques.",
    
    "UVillas de San Ignacio , Vía Girón , Carrera 10 , Café Madrid , Vía Bucaramanga , Barrio Kennedy , Carrera 15 , Calle 26 , Carrera 12 , Calle 15 , Minuto De Dios , Hospital Local del Norte , Colseguros , Miramar , Portal Norte Ciudad Jardín , Vía Bucaramanga , Carrera 15 , Avenida Quebradaseca , Carrera 18 , Calle 45 , Calle 48 , Carrera 33 , Carretera Antigua , Plaza Satélite , Diagonal 105 , Puente Provenza , Calle 105 , Glorieta INEM , Calle 105 , Cancha El Dangond , Calle 109 , Carrera 15D.",
  ],
  "VALOR DEL PASAJE 2700",
),

Bus(
  "San Juan",
  "Ruta H",
  "assets/bus8.jpg",
  [
    "Terminal (INICIO)",
    "antiguo matadero de floridaa",
    "colegio quinta del puente",
    "CARRERA 15 limoncito",
    "avenica bucarica",
    "carretera antigua",
    "plaza satelite",
    "puente el bueni"
    "mirador de arenales",
    "intercambiador palenque",
    "POBLADO",
    "puente provenza",
    "carretera antigua",
    "bucaria",
    "andes",
    "terminal (FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),

Bus(
  "Flotax",
  "Ruta I",
  "assets/bus9.jpg",
  [
    "cumbre (INICIO)",
    "carretera antigual",
    "Villabel",
    "rosales",
    "caracoli",
    "canaveral",
    "anillo vial",
    "Grion(FIN)",
  ],
  "VALOR DEL PASAJE 2800",
),

Bus(
  "Transpiedecuesta",
  "Ruta J",
  "assets/bus10.jpg",
  [
    "Piedecuesta (INICIO)",
    "Floridablanca",
    "Carretera antigua",
    "CCCACIQUE",
    "Carrera 21",
    "glorieta san francisco",
    "avenida la rosita"
    "avenida gonzales valencia",
    "carretera antigua",
    "casco urbano Floridablnaca",
    "autopista floridablanca - Piedecuesta",
    "Parque principal Piedecuesta (FIN)",
  ],
  "VALOR DEL PASAJE 2700",
),

  ];

  @override
  _BusInfoScreenState createState() => _BusInfoScreenState();
}

class _BusInfoScreenState extends State<BusInfoScreen> {
  TextEditingController searchController = TextEditingController();
  List<Bus> filteredBuses = [];

  @override
  void initState() {
    super.initState();
    filteredBuses.addAll(widget.buses);
  }

  void filterSearchResults(String query) {
    List<Bus> searchResults = [];
    searchResults.addAll(widget.buses);

    if (query.isNotEmpty) {
      searchResults.retainWhere((bus) => bus.name.toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredBuses.clear();
      filteredBuses.addAll(searchResults);
    });
  }

  Future<void> fetchRoutesForBus(BuildContext? context, Bus bus) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/sisgebus-backend/index.jsp'),
        headers: {
          'proccess': 'getRoutes',
        },
      );

      String routesInfo = response.body;

      // Obtener la dirección desde la información de rutas
      String address = parseAddressFromRoutesInfo(routesInfo);

      showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          title: Text('Dirección de rutas'),
          content: Text(address),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    } catch (error) {
      print('Error fetching routes: $error');
      showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Error al obtener información de rutas'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  // Función para extraer la dirección de la información de rutas
  String parseAddressFromRoutesInfo(String routesInfo) {
    // Lógica para extraer la dirección específica, puedes ajustar esto según la respuesta real del servidor
    // Por ejemplo, si la respuesta es en formato JSON, puedes utilizar una librería para parsear el JSON y extraer la dirección.
    // Aquí estoy usando una lógica simple para propósitos de demostración.
    return 'Dirección de ejemplo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Buses'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BusSearch(filteredBuses));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                labelText: 'Buscar autobús',
                hintText: 'Ingrese el nombre del autobús...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBuses.length,
              itemBuilder: (context, index) {
                return BusCard(
                  bus: filteredBuses[index],
                  onPressedRoutes: () {
                    fetchRoutesForBus(context, filteredBuses[index]);
                  },
                  onPressedBusStands: () {
                    // Lógica para el botón de obtener paradas
                  },
                  onPressedPassengers: () {
                    // Lógica para el botón de obtener pasajeros
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}






class BusSearch extends SearchDelegate<Bus> {
  final List<Bus> buses;

  BusSearch(this.buses);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Bus selectedBus = buses.isNotEmpty
          ? buses[0]  // Obtener el primer bus de la lista
          : Bus('', '', '', [''], '');  // O proporcionar valores predeterminados
      close(context, selectedBus);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Bus> searchResults = buses.where((bus) => bus.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return BusCard(bus: searchResults[index], onPressedRoutes: () {  }, onPressedBusStands: () {  }, onPressedPassengers: () {  },);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Bus> suggestionList = buses.where((bus) => bus.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            query = suggestionList[index].name;
            showResults(context);
          },
        );
      },
    );
  }
}

class BusCard extends StatelessWidget {
  final Bus bus;
  final VoidCallback onPressedRoutes;
  final VoidCallback onPressedBusStands;
  final VoidCallback onPressedPassengers;

  const BusCard({
    required this.bus,
    required this.onPressedRoutes,
    required this.onPressedBusStands,
    required this.onPressedPassengers,
  });

  Future<void> fetchRoutesForBus(BuildContext? context, Bus bus) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/sisgebus-backend/index.jsp'),
        headers: {
          'proccess': 'getRoutes',
        },
      );

      String routesInfo = response.body;

      // Obtener la dirección desde la información de rutas
      String address = parseAddressFromRoutesInfo(routesInfo);

      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text('Dirección de rutas: $address'),
        ),
      );
    } catch (error) {
      print('Error fetching routes: $error');
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text('Error al obtener información de rutas'),
        ),
      );
    }
  }

  // Función para extraer la dirección de la información de rutas
  String parseAddressFromRoutesInfo(String routesInfo) {
    // Lógica para extraer la dirección específica, puedes ajustar esto según la respuesta real del servidor
    // Por ejemplo, si la respuesta es en formato JSON, puedes utilizar una librería para parsear el JSON y extraer la dirección.
    // Aquí estoy usando una lógica simple para propósitos de demostración.
    return 'Dirección de ejemplo';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BusInfoWidget(
          bus: bus,
          onPressedQR: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Image.asset(
                  'assets/qr.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
          onPressedRoutes: () async {
            await fetchDataAndShowDialog(
              context, 'getRoutes', 'Rutas para ${bus.name}',
            );
          },
          onPressedBusStands: () async {
            await fetchDataAndShowDialog(
              context, 'getBusStands', 'Paradas para ${bus.name}',
            );
          },
          onPressedPassengers: () async {
            await fetchDataAndShowDialog(
              context, 'getPassengers', 'Pasajeros para ${bus.name}',
            );
          },
        ),
      ],
    );
  }
  
  fetchDataAndShowDialog(BuildContext context, String s, String t) {}
}






class BusInfoWidget extends StatelessWidget {
  final Bus bus;
  final VoidCallback onPressedQR;
  final VoidCallback onPressedRoutes;
  final VoidCallback onPressedBusStands;
  final VoidCallback onPressedPassengers;

  const BusInfoWidget({
    required this.bus,
    required this.onPressedQR,
    required this.onPressedRoutes,
    required this.onPressedBusStands,
    required this.onPressedPassengers,
  });

  Future<void> fetchDataAndShowDialog(
      BuildContext context, String process, String title) async {
    try {
      final response = await http.get(
        Uri.parse('http://localhost:8080/sisgebus-backend/index.jsp'),
        headers: {
          'proccess': process,
        },
      );

      String info = response.body;

      List<String> lines = info.split('\n');

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Container(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lines.map((line) => Text(line)).toList(),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        ),
      );
    } catch (error) {
      print('Error fetching information: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al obtener información'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(
            bus.imagePath,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bus.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('Ruta: ${bus.route}'),
                Text('Información adicional: ${bus.additionalInfo}'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: onPressedQR,
                  child: Text('Mostrar QR'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await fetchDataAndShowDialog(
                        context, 'getRoutes', 'Rutas para ${bus.name}');
                  },
                  child: Text('Obtener Rutas para ${bus.name}'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await fetchDataAndShowDialog(
                        context, 'getBusStands', 'Paradas para ${bus.name}');
                  },
                  child: Text('Obtener Paradas para ${bus.name}'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await fetchDataAndShowDialog(
                        context, 'getPassengers', 'Pasajeros para ${bus.name}');
                  },
                  child: Text('Obtener Pasajeros para ${bus.name}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
















class BusDetailScreen extends StatelessWidget {
  final Bus bus;

  BusDetailScreen({required this.bus});

  Future<String> fetchBusInfo() async {
    final response = await http.get(
      Uri.parse('http://localhost:8080/sisgebus-backend/index.jsp'),
      headers: {
        'proccess': 'getBuses', // Añade tu cabecera aquí
      },
    );
    
    if (response.statusCode == 200) {
      // Si la solicitud es exitosa, devuelve el cuerpo de la respuesta
      return response.body;
    } else {
      // Si la solicitud falla, lanza una excepción
      throw Exception('Failed to load bus info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bus.name),
      ),
      body: FutureBuilder(
        future: fetchBusInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            // Aquí puedes mostrar la información obtenida del backend
            String busInfo = snapshot.data.toString();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    bus.imagePath,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus.name,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text('Ruta: ${bus.route}'),
                        Text('Información adicional: ${bus.additionalInfo}'),
                        Text(
                          busInfo.toString(),  // Agrega el método toString() aquí
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

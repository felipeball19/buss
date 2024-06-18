from graphviz import Digraph

# Crear el objeto Digraph
dot = Digraph()

# Definir los nodos y las conexiones
dot.node('Inicio', 'Inicio')
dot.node('Iniciar Sesión', 'Iniciar Sesión')
dot.node('Menú Principal', 'Menú Principal')
dot.node('Registrar Ingresos', 'Registrar Ingresos')
dot.node('Ingresar Datos de Ingresos', 'Ingresar Datos de Ingresos')
dot.node('Registrar Gastos', 'Registrar Gastos')
dot.node('Ingresar Datos de Gastos', 'Ingresar Datos de Gastos')
dot.node('Consultar Información', 'Consultar Información')
dot.node('Consultar Registros', 'Consultar Registros')
dot.node('Realizar Cobros', 'Realizar Cobros')
dot.node('Registrar Cobros', 'Registrar Cobros')
dot.node('Análisis de Datos', 'Análisis de Datos')
dot.node('Generar Análisis', 'Generar Análisis')
dot.node('Generar Gráficas', 'Generar Gráficas')
dot.node('Visualizar Gráficas', 'Visualizar Gráficas')
dot.node('Modificar Datos', 'Modificar Datos')
dot.node('Editar Datos', 'Editar Datos')
dot.node('Calcular Promedios', 'Calcular Promedios')
dot.node('Obtener Promedios', 'Obtener Promedios')
dot.node('Tomar Decisiones', 'Tomar Decisiones')
dot.node('Decisiones Estratégicas', 'Decisiones Estratégicas')

# Definir las conexiones entre los nodos
dot.edge('Inicio', 'Iniciar Sesión')
dot.edge('Iniciar Sesión', 'Menú Principal')
dot.edge('Menú Principal', 'Registrar Ingresos')
dot.edge('Registrar Ingresos', 'Ingresar Datos de Ingresos')
dot.edge('Menú Principal', 'Registrar Gastos')
dot.edge('Registrar Gastos', 'Ingresar Datos de Gastos')
dot.edge('Menú Principal', 'Consultar Información')
dot.edge('Consultar Información', 'Consultar Registros')
dot.edge('Menú Principal', 'Realizar Cobros')
dot.edge('Realizar Cobros', 'Registrar Cobros')
dot.edge('Menú Principal', 'Análisis de Datos')
dot.edge('Análisis de Datos', 'Generar Análisis')
dot.edge('Menú Principal', 'Generar Gráficas')
dot.edge('Generar Gráficas', 'Visualizar Gráficas')
dot.edge('Menú Principal', 'Modificar Datos')
dot.edge('Modificar Datos', 'Editar Datos')
dot.edge('Menú Principal', 'Calcular Promedios')
dot.edge('Calcular Promedios', 'Obtener Promedios')
dot.edge('Menú Principal', 'Tomar Decisiones')
dot.edge('Tomar Decisiones', 'Decisiones Estratégicas')

# Renderizar el gráfico en formato PNG
dot.render('diagrama_actividades', format='png', cleanup=True)

print("Diagrama de actividades generado con éxito como 'diagrama_actividades.png'")

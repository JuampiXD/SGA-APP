

class Course {
  Course(this.name, this.career,this.semester,this.classmates);

   String name;
   String career;
   String semester;
   List<Classmate> classmates;
}

class Classmate {
  Classmate(this.firstName, this.lastName,this.email);

  final String firstName;
  final String lastName;
  final String email;
}

class Assitance {
  Assitance(this.name, this.date,this.detailsAssistance);

  final String name;
  final String date;
  final List<DetailsAssitance> detailsAssistance;
}

class DetailsAssitance {
  DetailsAssitance(this.firstName, this.lastName,this.details);

  final String firstName;
  final String lastName;
  final String details;
}












class Uniforme {
  Uniforme(this.titulo, this.imagen);

  final String titulo;
  final String imagen;
}

class Proyecto {
  Proyecto(this.titulo, this.imagen, this.fecha, this.descripcion, this.pdf);

  final String titulo;
  final String imagen;
  final DateTime fecha;
  final String descripcion;
  final String pdf;
}

class Producto {
  Producto(this.titulo, this.imagen, this.fecha, this.descripcion);

  final String titulo;
  final String imagen;
  final DateTime fecha;
  final String descripcion;
}

class Revista {
  Revista(this.titulo, this.edicion, this.gestion, this.portada, this.pdf);

  final String titulo;
  final String edicion;
  final String gestion;
  final String portada;
  final String pdf;
}

class Laboratorio {
  Laboratorio(
    this.nombre,
    this.logo,
    this.virtual,
    this.objetivo,
    this.acceso,
  );

  final String nombre;
  final String logo;
  final String virtual;
  final String objetivo;
  final String acceso;
}

class Sociedad {
  Sociedad(
      this.titulo,
      this.estudiante_nombre,
      this.docente_nombre,
      this.vision,
      this.mision,
      this.logo,
      this.estatuto,
      this.estudiante_imagen,
      this.docente_imagen);

  final String titulo;
  final String estudiante_nombre;
  final String docente_nombre;
  final String mision;
  final String vision;

  final String logo;
  final String estatuto;
  final String estudiante_imagen;
  final String docente_imagen;
}

class Oferta {
  Oferta(
      this.titulo, this.nombre_director, this.foto_director, this.descripcion);

  final String titulo;
  final String nombre_director;
  final String foto_director;
  final String descripcion;
}

class CarreraModelo {
  CarreraModelo(
      this.titulo,
      this.objetivo,
      this.competencia,
      this.campo,
      this.horarios,
      this.examenes,
      this.defensas,
      this.logo,
      this.malla,
      this.informacion,
      this.contenido);

  final String titulo;
  final String objetivo;
  final String competencia;
  final String campo;

  final List<Elemento> horarios;
  final List<Elemento> examenes;
  final List<Elemento> defensas;

  final String logo;
  final String malla;
  final String informacion;
  final String contenido;
}

class Actividad {
  Actividad(this.titulo, this.imagen, this.descripcion);

  final String titulo;
  final List<String> imagen;
  final String descripcion;
}

class Elemento {
  Elemento(this.nombre, this.archivo);

  final String nombre;
  final String archivo;
}

class Ingles {
  Ingles(this.nombre, this.descripcion, this.logo);

  final String nombre;
  final String descripcion;
  final String logo;
}



class InformacionPosgrado {
  InformacionPosgrado(this.campo, this.valor);

  final String campo;
  final String valor;
}


class TipoPosgrado {
  TipoPosgrado(this.nombre, this.portadas, this.logo);

  final String nombre;
  final List<String> portadas;
  final String logo;
}


class Posgrado {
  Posgrado(this.nombre, this.tipo, this.logo, this.informaciones);

  final String nombre;
  final String tipo;
  final String logo;
  final List<InformacionPosgrado> informaciones;
}

class Convenio {
  Convenio(this.institucion, this.objetivo, this.direccion, this.beneficios,
      this.beneficiarios, this.tipo, this.logo);

  final String institucion;
  final String objetivo;
  final String direccion;
  final String beneficios;
  final String beneficiarios;
  final String tipo;
  final String logo;
}

class BecaDescuento {
  BecaDescuento(
    this.nombre,
    this.definicion,
    this.requisitos,
    this.porcentaje,
  );

  final String nombre;
  final String definicion;
  final String requisitos;
  final String porcentaje;
}

class NoticiaElement {
  NoticiaElement(this.id, this.media_type, this.media_url);

  final String id;
  final String media_type;
  final String media_url;
}

class NoticiaPost {
  NoticiaPost(
    this.caption,
    this.media_type,
    this.media_url,
    this.children,
  );

  final String caption;
  final String media_type;
  final String media_url;
  final List<NoticiaElement> children;
}

class InstruccionModelo {
  InstruccionModelo(this.descripcion, this.horarios, this.examenes,
      this.companias, this.portada, this.portada2);

  final String descripcion;

  final List<Elemento> horarios;
  final List<Elemento> examenes;
  final List<Elemento> companias;

  final String portada;
  final String portada2;
}

class Oficial {
  Oficial(this.nombre, this.cargo, this.foto);

  final String nombre;
  final String cargo;
  final String foto;
}

class Plataforma {
  Plataforma(this.nombre, this.tipo, this.informacion);

  final String nombre;

  final String tipo;
  final String informacion;
}

-- rol
INSERT INTO `gimnasio`.`rol` (`id_rol`, `descripcion`) VALUES ('1', 'admin');
INSERT INTO `gimnasio`.`rol` (`id_rol`, `descripcion`) VALUES ('2', 'encargado');
INSERT INTO `gimnasio`.`rol` (`id_rol`, `descripcion`) VALUES ('3', 'usuario');

-- plan
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('1', 'All Levels', 'Entrenamiento apto para todas las edades y género', '2022-12-31');
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('2', 'Advanced', 'Entrenamiento de crossfit avanzado', '2022-12-31');
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('3', 'Cardio', 'Ejercicios cardiovasculares', '2023-12-31');
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('4', 'Funcional', 'Ejercicios que se adaptan a los movimientos naturales del cuerpo humano', '2023-12-31');
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('5', 'Yoga', 'Posturas físicas, ejercicios de respiración y meditación', '2022-12-31');
INSERT INTO `gimnasio`.`plan` (`id_plan`, `nombre`, `descripcion`, `fecha_expiracion`) VALUES ('6', 'Fuerza', 'Entrenamiento de fuerza muscular', '2024-12-31');

-- usuario
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_rol`, `fecha_nacimiento`) VALUES ('1', 'Lucas', 'Saavedra', '341 635-7732', 'DNI', '42044863', 'luc4ssavv@gmail.com', 'Masculino', 'lucassav12', 'contraseniaa11', 'Balcarce 1458', '2', '1996-03-28');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_rol`, `fecha_nacimiento`) VALUES ('2', 'Juan Jose', 'Ibarra', '341 228-7356', 'DNI', '39239476', 'jjibarra@outlook.com', 'Masculino', 'jujoabc', 'milanesagrande892', 'Italia 892', '2', '1989-06-12');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('3', 'Luis', 'Nieto', '3329 59-5483', 'DNI', '42965423', 'luisingnn@gmail.com', 'Masculino', 'luchotop', 'guantelete', '9 de Julio 3023', '1', '3', '2000-04-26');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('4', 'Angela', 'Castro', '341 672-8871', 'DNI', '42164672', 'angelacastro0@gmail.com.ar', 'Femenino', 'angieecc', 'f4bric4dep4stas', 'Cerrito 464', '4', '3', '1999-12-10');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('5', 'German', 'Perez', '3460 69-1417', 'DNI', '38923598', 'germanoperez@gmail.com', 'Masculino', 'germancito', 'aleatorio0o0', 'Francia 1221', '3', '3', '1985-01-27');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('6', 'Sara', 'Guirado', '3415 96-5937', 'DNI', '43077525', 'saritaguirado20@gmail.com', 'Femenino', 'saraa19', 'unodostres321', 'Moreno 2013', '4', '3', '2002-04-28');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('7', 'Camila', 'Morilla', '3412 76-8213', 'DNI', '45698127', 'acamiliamor@outlook.com', 'camillusy', 'pizzaconanchoas', 'Zeballos 1342', '2', '3', '2004-02-26');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_plan`, `id_rol`, `fecha_nacimiento`) VALUES ('8', 'Andres', 'Jimeno', '3464 62-0330', 'DNI', '36289631', 'adresjimeno@abc.gov.ar', 'Masculino', 'andresitoo', 'andresstmb', 'Saavedra 543', '5', '3', '1985-07-22');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_rol`, `fecha_nacimiento`) VALUES ('9', 'Josefina', 'Sanchez', '341 553-9241', 'DNI', '40123891', 'josesanchez@gmail.com', 'Femenino', 'josesa', 'facildehackear0', 'Laprida 2020', '2', '1994-12-31');
INSERT INTO `gimnasio`.`usuario` (`id_usuario`, `nombre`, `apellido`, `telefono`, `tipo_doc`, `dni`, `email`, `genero`, `username`, `password`, `direccion`, `id_rol`, `fecha_nacimiento`) VALUES ('10', 'Administrador', 'Supremo', '000 000-0000', 'DNI', '1000000', 'adminsupremo@god.com', 'UNDEFINED', 'admin', 'admin', 'Nowhere 0000', '1', '0000-01-01');

-- instructor

INSERT INTO `gimnasio`.`instructor` (`dni`, `tipo_doc`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`) VALUES ('42019128', 'DNI', 'Juana', 'Perello', '1996-10-29', 'juannapep@gmail.com', '341 890-9442');
INSERT INTO `gimnasio`.`instructor` (`dni`, `tipo_doc`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`) VALUES ('43149283', 'DNI', 'Hugo', 'Lozano', '1999-02-28', 'hugitoloz@outlook.com', '3436 43-0399');
INSERT INTO `gimnasio`.`instructor` (`dni`, `tipo_doc`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`) VALUES ('44874221', 'DNI', 'Maria', 'Carrera', '1997-04-25', 'mariacarrera@gmail.com', '341 506-9595');
INSERT INTO `gimnasio`.`instructor` (`dni`, `tipo_doc`, `nombre`, `apellido`, `fecha_nacimiento`, `email`, `telefono`) VALUES ('37129807', 'DNI', 'Aurelio', 'Buendia', '1989-02-12', 'aurelionsol@gmail.com', '2478 51-5909');

-- grupo_musculo

INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('1', 'Pectoral', 'Músculo compuesto, conecta la parte delantera del pecho humano');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('2', 'Dorsal', 'Músculo compuesto, localizado posterior al brazo');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('3', 'Cuádriceps', 'Compuesto de cuatro cabezas musculares');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('4', 'Bíceps', 'Pertenece a la región anterior del brazo, formado por dos cabezas');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('5', 'Tríceps', 'Músculo situado en la región posterior del brazo');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`) VALUES ('6', 'Hombros');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('7', 'Isquios', 'Grupo de 3 músculos, extendido a lo largo de la parte posterior del muslo desde la cadera hasta la zona justo debajo de la rodilla');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('8', 'Glúteos', 'Músculos situados detras de la pelvis');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`) VALUES ('9', 'Abdominales');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`) VALUES ('10', 'Antebrazo');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`) VALUES ('11', 'Cuello');
INSERT INTO `gimnasio`.`grupo_musculo` (`id_grupo`, `nombre`, `comentario`) VALUES ('12', 'Gemelos', 'Formado por 2 cabezas musculares, situado en la región posterior de la pierna');

-- ejercicio

INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('1', 'Squat', 'Sentadillas o cuclillas, ejercicio básico del entrenamiento de fuerza', 'https://deportesyeducacionfisica.com/wp-content/uploads/2012/03/hacer-sentadillas-correctamente.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('2', 'Crunches', 'Ejercicio abdominal', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunch-1588842220.jpg?resize=480:*');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('3', 'Plank', 'Ejercicio abdominal', 'https://mejorconsalud.as.com/wp-content/uploads/2016/11/Hacer-plank-todos-los-di%CC%81as.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('4', 'Push Press', 'Ejercicios de empuje con hombros', 'https://www.rutinaejercicios.com/pushpress.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('5', 'SDHP', 'Sumo Deadlift High Pull. Ejercicio compuesto', 'https://i.ytimg.com/vi/gh55vVlwlQg/maxresdefault.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('6', 'KB Row', 'Remo con pesa rusa', 'https://i.blogs.es/23f5ad/kbinfo_dblbentoverrow/450_1000.webp');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('7', 'Power Clean', 'Ejercicio compuesto decarga de barra', 'https://i.ytimg.com/vi/0aP3tgKZcHQ/maxresdefault.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('8', 'Front Squat', 'Sentadilla con barra en la parte posterior', 'https://static.strengthlevel.com/images/illustrations/front-squat-1000x1000.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('9', 'Box Jump', 'Salto sobre cajón', 'https://media.istockphoto.com/vectors/box-jumps-woman-silhouettes-colorful-plyometric-exercise-illustration-vector-id1214450733?k=20&m=1214450733&s=170667a&w=0&h=sNbGnKZdb10KXppplGN25nYrAtPY82-iqiOsHQn5Q6c=');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('10', 'HSPU', 'Handstand Push Up. Empuje hacia arriba de todo el cuerpo', 'https://www.estilorx.com/wp-content/uploads/2015/03/handstand-pushup-flexiones-invertidas-crossfit.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('11', 'Hollow Rock', 'Ejercicio abdominal', 'https://images.hola.com/imagenes/estar-bien/20210315185932/ejercicio-abdominales-hollow-rock/0-929-847/hollow-rock-z.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('12', 'Run', 'Correr', 'https://us.123rf.com/450wm/neyro2008/neyro20081509/neyro2008150900122/45734642-ejecuci%C3%B3n-de-siluetas-de-personas-corrida-deporte-fitness-activo-el-ejercicio-y-la-atleta-ilustraci%C3%B3.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('13', 'Rope Jump', 'Salto a la cuerda', 'https://www.mensjournal.com/wp-content/uploads/mf/101-best-workouts-the-best-jump-rope-workout-3.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('14', 'Push Ups', 'Lagartijas', 'https://www.outsideonline.com/wp-content/uploads/2017/07/27/perfect-push-up_s.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('15', 'V-Ups', 'Ejercicio abdominal', 'https://previews.123rf.com/images/logo3in1/logo3in11806/logo3in1180600007/103193136-mujer-mostrando-paso-de-entrenamiento-abdominal-con-ejercicio-v-ups-ilustraci%C3%B3n-sobre-movimientos-co.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `imagen`) VALUES ('16', 'Pull Ups', 'https://www.puntofape.com/wp-content/uploads/2016/05/pullup-con-agarre-abierto.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('17', 'Muscle Ups', 'Ejercicio compuesto', 'https://mundoentrenamiento.com/wp-content/uploads/2021/08/ejecucion-del-muscle-up.jpeg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `comentario`, `imagen`) VALUES ('18', 'Deadlift', 'Peso muerto', 'https://image.shutterstock.com/image-vector/man-doing-barbell-deadlifts-exercise-260nw-2031951569.jpg');
INSERT INTO `gimnasio`.`ejercicio` (`id_ejercicio`, `nombre`, `imagen`) VALUES ('19', 'Burpee', 'https://i.imgur.com/a56Ib2p.jpg');

-- ejercicio_grupo

INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '1');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '1');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '1');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('9', '2');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('9', '3');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('2', '4');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('6', '4');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '5');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('6', '5');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '5');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '5');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('2', '6');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '6');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '7');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '7');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '7');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '8');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '8');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '8');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '9');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '9');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '9');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('12', '9');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('2', '10');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('4', '10');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('5', '10');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('6', '10');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '10');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('9', '11');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '12');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '12');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '12');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('12', '12');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '13');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '13');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '13');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('12', '13');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('1', '14');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('4', '14');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('5', '14');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '14');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('9', '15');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('2', '16');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('4', '16');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('5', '16');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('6', '16');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '16');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('2', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('4', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('5', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('6', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('1', '17');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '18');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('1', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('3', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('4', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('5', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('7', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('8', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('10', '19');
INSERT INTO `gimnasio`.`ejercicio_grupo` (`id_grupo`, `id_ejercicio`) VALUES ('12', '19');


unit uIdiomas;

interface

uses
  System.IniFiles;

var
  Idioma: TIniFile;
  Var1, Var2, Var3, Var4, Var5, Var6, Var7, Var8, Var9, Var10, Var11, Var12,
  Var13, Var14, Var15, Var16, Var17, Var18, Var19, Var20, Var21, Var22, Var23,
  Var24, Var25, Var26, Var27, Var28, Var29, Var30, Var31, Var32, Var33, Var34,
  Var35, Var36, Var37, Var38, Var39, Var40, Var41, Var42, Var43, Var44, Var45,
  Var46, Var47, Var48, Var49, Var50, Var51, Var52, Var53, Var54: String;

Procedure Traduce(LangFile: String);

implementation

uses
  uUOS, About, uAddToList, uListaGuardada;

Procedure Traduce(LangFile: String);
begin
  Idioma := TIniFile.Create(LangFile);
  Try
    //[Principal]
    Form1.Label1.Caption:= Idioma.ReadString('Principal', 'Label1Caption', 'Inicio:');
    Form1.Label2.Caption:= Idioma.ReadString('Principal', 'Label2Caption', 'Fin:');
    Form1.Label3.Caption:= Idioma.ReadString('Principal', 'Label3Caption', 'Bytes:');
    Form1.Label4.Caption:= Idioma.ReadString('Principal', 'Label4Caption', 'Valor:');
    Form1.RadAvFucker.Hint:=Idioma.ReadString('Principal', 'RadAvFuckerHint', 'Selecciona para realizar AvFucker.');
    Form1.RadDSplit.Hint:= Idioma.ReadString('Principal', 'RadDSplitHint', 'Selecciona para realizar DSplit.');
    Form1.EdInicio.Hint:= Idioma.ReadString('Principal', 'EdInicioHint', 'Doble click para resetear el valor (1000).');
    Form1.EdFin.Hint:= Idioma.ReadString('Principal', 'EdFinHint', 'Doble click para resetear el valor (Tamaño del Fichero -1).');
    Form1.EdBytes.Hint:= Idioma.ReadString('Principal', 'EdBytesHint', 'Doble click para resetear el valor (1000).');
    Form1.EdValor.Hint:= Idioma.ReadString('Principal', 'EdValorHint', 'Doble click para resetear el valor (90).');
    Form1.GroupBox1.Caption:= Idioma.ReadString('Principal', 'GroupBox1Caption', 'Opciones');
    Form1.CheckVaciar.Caption:= Idioma.ReadString('Principal', 'CheckVaciarCaption', 'Vaciar directorio de trabajo.');
    Form1.CheckGen.Caption:= Idioma.ReadString('Principal', 'CheckGenCaption', 'Generar lista al terminar.');
    Form1.ChkRecordar.Caption:= Idioma.ReadString('Principal', 'ChkRecordarCaption', 'Recordar directorio de trabajo.');
    Form1.ListView1.Columns[0].Caption:= Idioma.ReadString('Principal', 'ListView1Columns1Caption', 'Inicio');
    Form1.ListView1.Columns[1].Caption:= Idioma.ReadString('Principal', 'ListView1Columns2Caption', 'Fin');
    Form1.BtnIniciar.Caption:= Idioma.ReadString('Principal', 'BtnIniciarCaption', 'Iniciar');
    Form1.CheckAll.Caption:= Idioma.ReadString('Principal', 'CheckAllCaption', 'Seleccionar todos.');
    Form1.BtnAVFLista.Caption:= Idioma.ReadString('Principal', 'BtnAVFListaCaption', 'AvFuck al listado');
    Form1.BtnMostrarLista.Caption:= Idioma.ReadString('Principal', 'BtnMostrarListaCaption', 'Mostrar lista');
    Form1.BDetener.Caption:= Idioma.ReadString('Principal', 'BDetenerCaption', 'Detener');
    Form1.RadComb.Hint:= Idioma.ReadString('Principal', 'RadCombHint', 'Selecciona para realizar las 256 Combinaciones.');
    Form1.RadComb.Caption:= Idioma.ReadString('Principal', 'RadCombCaption', '256 Combin.');
    Form1.GroupBox2.Caption:= Idioma.ReadString('Principal', 'GroupBox2Caption', 'Opciones');
    Form1.Label5.Caption:= Idioma.ReadString('Principal', 'Label5Caption', 'Inicio:');
    Form1.Label6.Caption:= Idioma.ReadString('Principal', 'Label6Caption', 'Fin:');
    Form1.Label7.Caption:= Idioma.ReadString('Principal', 'Label7Caption', 'Escribe las Offsets separadas con ESPACIOS:');
    Form1.Label8.Caption:= Idioma.ReadString('Principal', 'Label8Caption', 'Máx: ');
    Form1.Label9.Caption:= Idioma.ReadString('Principal', 'Label9Caption', 'Máx: ');
    Form1.Label10.Caption:= Idioma.ReadString('Principal', 'Label10Caption', 'Máx: ');
    Form1.RadProgresivo.Caption:= Idioma.ReadString('Principal', 'RadProgresivoCaption', 'Progresivo');
    Form1.RadSelectivo.Caption:= Idioma.ReadString('Principal', 'RadSelectivoCaption', 'Selectivo');
    Form1.ChkAv1Byte.Caption:= Idioma.ReadString('Principal', 'ChkAv1ByteCaption', 'AvFuck Listado a 1 byte.');
    Form1.ChkRestar.Caption:= Idioma.ReadString('Principal', 'ChkRestarCaption', 'Restar Bytes autom. (Lista).');
    Form1.BtnDetenerLista.Caption:= Idioma.ReadString('Principal', 'BtnDetenerListaCaption', 'Detener');
    Form1.ChkAleatorio.Caption:= Idioma.ReadString('Principal', 'ChkAleatorioCaption', 'Aleatorio');
    Form1.Label11.Caption:= Idioma.ReadString('Principal', 'Label11Caption', 'Hex original:');
    Form1.Label12.Caption:= Idioma.ReadString('Principal', 'Label12Caption', 'Reemplazar por:');
    Form1.Label13.Caption:= Idioma.ReadString('Principal', 'Label13Caption', 'Inicio:');
    Form1.Label14.Caption:= Idioma.ReadString('Principal', 'Label14Caption', 'Fin:');
    Form1.Label15.Caption:= Idioma.ReadString('Principal', 'Label15Caption', 'Máx: ');
    Form1.Label16.Caption:= Idioma.ReadString('Principal', 'Label16Caption', 'Máx: ');
    Form1.BtnIniciarR.Caption:= Idioma.ReadString('Principal', 'BtnIniciarRCaption', 'Iniciar');
    Form1.BtnDetenerR.Caption:= Idioma.ReadString('Principal', 'BtnDetenerRCaption', 'Detener');
    Form1.CheckVaciarR.Caption:= Idioma.ReadString('Principal', 'CheckVaciarRCaption', 'Vaciar directorio.');
    Form1.RadCompleto.Hint:= Idioma.ReadString('Principal', 'RadCompletoHint', 'Buscar y generar Offsets reemplazadas en fichero completo.');
    Form1.RadCompleto.Caption:= Idioma.ReadString('Principal', 'RadCompletoCaption', 'Fichero completo');
    Form1.RadRango.Hint:= Idioma.ReadString('Principal', 'RadRangoHint', 'Buscar y generar Offsets reemplazadas en un rango específico del fichero.');
    Form1.RadRango.Caption:= Idioma.ReadString('Principal', 'RadRangoCaption', 'Rango');
    Form1.Label17.Caption:= Idioma.ReadString('Principal', 'Label17Caption', 'Tiempo entre ejecuciones (Ms):');
    Form1.Label18.Caption:= Idioma.ReadString('Principal', 'Label18Caption', 'Sólo se comprobarán ficheros con extensión: ');
    Form1.Label19.Caption:= Idioma.ReadString('Principal', 'Label19Caption', 'Fichero para revisar funcionales:');
    Form1.ListView2.Columns[0].Caption:= Idioma.ReadString('Principal', 'ListView2Columns1Caption', 'Fichero');
    Form1.ListView2.Columns[1].Caption:= Idioma.ReadString('Principal', 'ListView2Columns2Caption', 'Funcional');
    Form1.EdEspera.Hint:= Idioma.ReadString('Principal', 'EdEsperaHint', 'Al introducir este valor, ten en cuenta si tu fichero tiene Delay. Doble click para reset.');
    Form1.BIniciarCh.Caption:= Idioma.ReadString('Principal', 'BIniciarChCaption', 'Iniciar');
    Form1.BDetenerCh.Caption:= Idioma.ReadString('Principal', 'BDetenerChCaption', 'Detener');
    Form1.RadioButton1.Caption:= Idioma.ReadString('Principal', 'RadioButton1Caption', 'Usar extensión del fichero');
    Form1.RadioButton2.Caption:= Idioma.ReadString('Principal', 'RadioButton2Caption', 'Otra extensión:');
    Form1.Edit4.Hint:= Idioma.ReadString('Principal', 'Edit4Hint', 'Especifica la extensión del fichero incluyendo el punto (.xxx)');
    Form1.CheckBox1.Hint:= Idioma.ReadString('Principal', 'CheckBox1Hint', 'El proceso de comprobación se detendrá al alcanzar este número (Solo si se revisan funcionales en tiempo real)');
    Form1.CheckBox1.Caption:= Idioma.ReadString('Principal', 'CheckBox1Caption', 'Detener si funcionales =');
    Form1.CheckBox2.Caption:= Idioma.ReadString('Principal', 'CheckBox2Caption', 'Scroll automático.');
    Form1.ChkRevFinal.Caption:= Idioma.ReadString('Principal', 'ChkRevFinalCaption', 'Revisar funcionales al finalizar y no en tiempo real.');
    Form1.ChkElimNoF.Hint:= Idioma.ReadString('Principal', 'ChkElimNoFHint', 'Usar con precaución asegurando un tiempo suficiente entre ejecuciones.');
    Form1.ChkElimNoF.Caption:= Idioma.ReadString('Principal', 'ChkElimNoFCaption', 'Eliminar ficheros no funcionales.');
    Form1.Label20.Caption:= Idioma.ReadString('Principal', 'Label20Caption', 'Separa las offsets a parchear con ESPACIOS:');
    Form1.Label21.Caption:= Idioma.ReadString('Principal', 'Label21Caption', 'Tapar con:');
    Form1.Label22.Caption:= Idioma.ReadString('Principal', 'Label22Caption', 'El fichero se guardará como...');
    Form1.Button3.Caption:= Idioma.ReadString('Principal', 'Button3Caption', 'Generar');
    Form1.EdFichero.Hint:= Idioma.ReadString('Principal', 'EdFicheroHint', 'Arrastra el fichero o pulsa el botón para añadir el fichero.');
    Form1.EdFichero.Text:= Idioma.ReadString('Principal', 'EdFicheroText', 'Ruta del fichero');
    Form1.EdDir.Hint:= Idioma.ReadString('Principal', 'EdDirHint', 'Arrastra el fichero o pulsa el botón para añadir el Directorio.');
    Form1.EdDir.Text:= Idioma.ReadString('Principal', 'EdDirText', 'Directorio de trabajo');
    Form1.Ajustes1.Caption:= Idioma.ReadString('Principal', 'Ajustes1Caption', 'Herramientas');
    Form1.Eliminartodoslosajustesyresetearaplicacin1.Caption:= Idioma.ReadString('Principal', 'Eliminartodoslosajustesyresetearaplicacin1Caption', 'Generar Anotador.exe');
    Form1.Skin1.Caption:= Idioma.ReadString('Principal', 'Skin1Caption', 'Skin');
    Form1.Acercade1.Caption:= Idioma.ReadString('Principal', 'Acercade1Caption', 'Ayuda');
    Form1.Visitarenlacedelproyecto1.Caption:= Idioma.ReadString('Principal', 'Visitarenlacedelproyecto1Caption', 'Visitar enlace del proyecto');
    Form1.Acercade2.Caption:= Idioma.ReadString('Principal', 'Acercade2Caption', 'Acerca de UdTools Offset Suite');
    Form1.Aadir1.Caption:= Idioma.ReadString('Principal', 'Aadir1Caption', 'Añadir Offsets');
    Form1.Eliminarseleccionados1.Caption:= Idioma.ReadString('Principal', 'Eliminarseleccionados1Caption', 'Eliminar Línea/s Seleccionada/s');
    Form1.Limpiar1.Caption:= Idioma.ReadString('Principal', 'Limpiar1Caption', 'Limpiar Lista');
    Form1.GuardarSeleccionadosenListaaparte1.Caption:= Idioma.ReadString('Principal', 'GuardarSeleccionadosenListaaparte1Caption', 'Guardar Línea/s en Lista Aparte');
    Form1.GuardarTodasenListaAparte1.Caption:= Idioma.ReadString('Principal', 'GuardarTodasenListaAparte1Caption', 'Guardar Todas en Lista Aparte');
    Form1.MostrarListaAlmacenada1.Caption:= Idioma.ReadString('Principal', 'MostrarListaAlmacenada1Caption', 'Mostrar Lista Almacenada');

    //[About]
    AboutBox.Version.Caption:= Idioma.ReadString('About', 'VersionCaption', 'Versión 1.0 Final');
    AboutBox.Copyright.Caption:= Idioma.ReadString('About', 'CopyrightCaption', 'Creado por Metal_Kingdom bajo licencia GPLv3');
    AboutBox.Comments.Caption:= Idioma.ReadString('About', 'CommentsCaption', 'Agradecimientos a toda la Comunidad de UdTools.net por toda la ayuda brindada incluyendo muchas de las características sugeridas y corrección de errores.');
    AboutBox.Web.Caption:= Idioma.ReadString('About', 'WebCaption', 'Visítanos en http://udtools.net');
    AboutBox.GitHub.Caption:= Idioma.ReadString('About', 'GitHubCaption', 'Visita el repositorio en GitHub');

    //[AddToList]
    Form2.Caption:= Idioma.ReadString('AddToList', 'Form2Caption', 'Añadir Offsets');
    Form2.Label1.Caption:= Idioma.ReadString('AddToList', 'Label1Caption', 'Inicio:');
    Form2.Label2.Caption:= Idioma.ReadString('AddToList', 'Label2Caption', 'Fin:');
    Form2.RadProgresivo.Caption:= Idioma.ReadString('AddToList', 'RadProgresivoCaption', 'Progresivo');
    Form2.RadSelectivo.Caption:= Idioma.ReadString('AddToList', 'RadSelectivoCaption', 'Selectivo (separa con espacios)');
    Form2.Button1.Caption:= Idioma.ReadString('AddToList', 'Button1Caption', 'Añadir al Listado');

    //[StoredList]
    Form3.Label1.Caption:= Idioma.ReadString('StoredList', 'Label1Caption', 'Haz doble click a un elemento de la lista para añadirlo al Locator.');
    Form3.Label2.Caption:= Idioma.ReadString('StoredList', 'Label2Caption', 'Inicio:');
    Form3.Label3.Caption:= Idioma.ReadString('StoredList', 'Label3Caption', 'Fin:');
    Form3.Label4.Caption:= Idioma.ReadString('StoredList', 'Label4Caption', 'Bytes:');
    Form3.ListView1.Columns[0].Caption:= Idioma.ReadString('StoredList', 'ListView1Columns1Caption', 'Inicio');
    Form3.ListView1.Columns[1].Caption:= Idioma.ReadString('StoredList', 'ListView1Columns2Caption', 'Fin');
    Form3.CheckBox1.Caption:= Idioma.ReadString('StoredList', 'CheckBox1Caption', 'Eliminar de la lista una vez añadido al Locator.');
    Form3.Button1.Caption:= Idioma.ReadString('StoredList', 'Button1Caption', 'Añadir');
    Form3.ChkRestar.Caption:= Idioma.ReadString('StoredList', 'ChkRestarCaption', 'Restar Bytes al añadir al Locator (1000 -> 100).');
    Form3.EliminarSeleccionados1.Caption:= Idioma.ReadString('StoredList', 'EliminarSeleccionados1Caption', 'Eliminar Seleccionados');
    Form3.LimpiarLista1.Caption:= Idioma.ReadString('StoredList', 'LimpiarLista1Caption', 'Limpiar Lista');

    //[Internal]
Var1=Cambios aplicados. Idioma.ReadString('Internal', 'Var1', 'yyyyyyy');
Var2=Secuencia no permitida. Idioma.ReadString('Internal', 'Var2', 'yyyyyyy');
Var3=Se añadieron offsets a la lista. Idioma.ReadString('Internal', 'Var3', 'yyyyyyy');
Var4=Info:Offset máxima permitida: Idioma.ReadString('Internal', 'Var4', 'yyyyyyy');
Var5=No hay ficheros para comprobar. Idioma.ReadString('Internal', 'Var5', 'yyyyyyy');
Var6=Comprobando fichero: Idioma.ReadString('Internal', 'Var6', 'yyyyyyy');
Var7=Sí Idioma.ReadString('Internal', 'Var7', 'yyyyyyy');
Var8=No Idioma.ReadString('Internal', 'Var8', 'yyyyyyy');
Var9=En espera Idioma.ReadString('Internal', 'Var9', 'yyyyyyy');
Var10=Buscando procesos no cerrados... Idioma.ReadString('Internal', 'Var10', 'yyyyyyy');
Var11=Eliminando ficheros no funcionales... Idioma.ReadString('Internal', 'Var11', 'yyyyyyy');
Var12=Proceso completado. Se encontraron Idioma.ReadString('Internal', 'Var12', 'yyyyyyy');
Var13=funcionales. Idioma.ReadString('Internal', 'Var13', 'yyyyyyy');
Var14=Proceso detenido al obtener Idioma.ReadString('Internal', 'Var14', 'yyyyyyy');
Var15=Estado: Vaciando carpeta... Idioma.ReadString('Internal', 'Var15', 'yyyyyyy');
Var16=Error Vaciando Carpeta: Idioma.ReadString('Internal', 'Var16', 'yyyyyyy');
Var17=Estado: Carpeta vaciada. Idioma.ReadString('Internal', 'Var17', 'yyyyyyy');
Var18=Proceso detenido. Idioma.ReadString('Internal', 'Var18', 'yyyyyyy');
Var19=Error de escritura AvFucker: Idioma.ReadString('Internal', 'Var19', 'yyyyyyy');
Var20=Proceso terminado. Idioma.ReadString('Internal', 'Var20', 'yyyyyyy');
Var21=Error de escritura DSplit: Idioma.ReadString('Internal', 'Var21', 'yyyyyyy');
Var22=Error e escritura Combinaciones (Prog.): Idioma.ReadString('Internal', 'Var22', 'yyyyyyy');
Var23=Error de escritura Combinaciones (Select.): Idioma.ReadString('Internal', 'Var23', 'yyyyyyy');
Var24=Proceso terminado con errores (ver LogErrores.txt) Idioma.ReadString('Internal', 'Var24', 'yyyyyyy');
Var25=Error Vaciando Carpeta: Idioma.ReadString('Internal', 'Var25', 'yyyyyyy');
Var26=Error de escritura Replacer: Idioma.ReadString('Internal', 'Var26', 'yyyyyyy');
Var27=Procesando fichero Idioma.ReadString('Internal', 'Var27', 'yyyyyyy');
Var28=Proceso completado. Encontradas  Idioma.ReadString('Internal', 'Var28', 'yyyyyyy');
Var29=coincidencias. Idioma.ReadString('Internal', 'Var29', 'yyyyyyy');
Var30=Fichero cargado. Idioma.ReadString('Internal', 'Var30', 'yyyyyyy');
Var31=Sólo se comprobarán ficheros con extensión: Idioma.ReadString('Internal', 'Var31', 'yyyyyyy');
Var32=El fichero se guardará como Idioma.ReadString('Internal', 'Var32', 'yyyyyyy');
Var33=Selecciona la carpeta de trabajo. Idioma.ReadString('Internal', 'Var33', 'yyyyyyy');
Var34=Directorio cargado. Idioma.ReadString('Internal', 'Var34', 'yyyyyyy');
Var35=Error: Valor incorrecto. Idioma.ReadString('Internal', 'Var35', 'yyyyyyy');
Var36=Fichero guardado correctamente. Idioma.ReadString('Internal', 'Var36', 'yyyyyyy');
Var37=Error: El fichero no se pudo guardar. ¿Fichero en uso? Idioma.ReadString('Internal', 'Var37', 'yyyyyyy');
Var38=Especifica el tiempo entre ejecuciones. Idioma.ReadString('Internal', 'Var38', 'yyyyyyy');
Var39=Si tu fichero tiene algún tipo de retardo, aumenta el tiempo entre ejecuciones o no se detectarán funcionales. Idioma.ReadString('Internal', 'Var39', 'yyyyyyy');
Var40=Ten en cuenta que los ficheros NO deben inyectarse en procesos externos. Idioma.ReadString('Internal', 'Var40', 'yyyyyyy');
Var41=Información Offsets Checker Idioma.ReadString('Internal', 'Var41', 'yyyyyyy');
Var42=Especifica el nombre del fichero que se genera al ejecutar tu fichero o anotador. Idioma.ReadString('Internal', 'Var42', 'yyyyyyy');
Var43=Ejemplo: funcionales.txt Idioma.ReadString('Internal', 'Var43', 'yyyyyyy');
Var44=Este fichero sirve de referencia para detectar los ficheros funcionales. Idioma.ReadString('Internal', 'Var44', 'yyyyyyy');
Var45=Es fundamental que este txt sea generado automáticamente al ejecutar tu fichero (sin pulsar nada más), de lo contrario no funcionará correctamente. Idioma.ReadString('Internal', 'Var45', 'yyyyyyy');
Var46=Si tienes dudas, usa el anotador incluido en el menú, no muestra ningún tipo de form, tan solo genera el txt si es funcional. Idioma.ReadString('Internal', 'Var46', 'yyyyyyy');
Var47=Información Offsets Checker Idioma.ReadString('Internal', 'Var47', 'yyyyyyy');
Var48=Fichero o Ruta inexistente. Idioma.ReadString('Internal', 'Var48', 'yyyyyyy');
Var49=Anotador.exe generado. Idioma.ReadString('Internal', 'Var49', 'yyyyyyy');
Var50=No se pudo generar el Anotador.exe Idioma.ReadString('Internal', 'Var50', 'yyyyyyy');
Var51=Máx: Idioma.ReadString('Internal', 'Var51', 'yyyyyyy');
Var52=Directorio de trabajo Idioma.ReadString('Internal', 'Var52', 'yyyyyyy');
Var53=Se añadieron offsets a la Lista Almacenada. Idioma.ReadString('Internal', 'Var53', 'yyyyyyy');
Var54=El programa se reiniciará para aplicar el Skin. Idioma.ReadString('Internal', 'Var54', 'yyyyyyy');

  Finally
    Idioma.Free;
  End;

end;
end.

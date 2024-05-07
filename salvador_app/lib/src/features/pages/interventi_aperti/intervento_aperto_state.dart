import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:salvador_task_management/src/models/articolo_model.dart';
import 'package:salvador_task_management/src/models/intervento_model.dart';
import 'package:salvador_task_management/src/repository/interventi_db_repository.dart';

part 'intervento_aperto_state.g.dart';

@Riverpod(keepAlive: true)
class InterventoApertoState extends _$InterventoApertoState {
  @override
  Intervento build() {
    var defaultIntervento = Intervento.empty();
    return defaultIntervento;
  }

  void setIntervento(Intervento intervento) {
    state = intervento;
  }

  void addRiga(Articolo item, Map<String, dynamic> params, Map<String, dynamic> resultMapDocId) {
    var intervento = state;
    int countRighe = state.righe.length;
    int rigaAdd = countRighe + 1; 

        DateTime now = DateTime.now();

    String? formattedDateTime = "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)} ${_twoDigits(now.hour)}:${_twoDigits(now.minute)}:${_twoDigits(now.second)}";
      DateTime dtOraIns = DateTime.parse(formattedDateTime);

    var nuovaRiga = Riga(
      id: null,
      idTestata: intervento.idTestata,
      idRiga: null,
      numOrdine: null,
      riga: rigaAdd,
      descrizione: params['note'],
      barcode: null,
      statusEvasione: null,
      articolo: InterventoArticolo(
        id: item.id,
        idListino: null,
        codice: item.codice,
        descrizione: item.descrizione,
        barcode: null,
        servizio: null,
        umPrincipale: item.unimis.codice,
        umProduzione: null,
        tipoArt: null,
        sottotipoArt: null,
        settore: null,
        gruppo: null,
        sottogruppo: null,
        marca: null,
        sagoma: null,
        modello: null,
        serie: null,
        caratteristica: null,
        codArtFornitore: null,
        gestitoDimensioni: false,
        dimensione1: null,
        dimensione2: null,
        dimensione3: null,
        dimensione4: null,
        dimensione5: null,
        attivaDim1: false,
        attivaDim2: false,
        attivaDim3: false,
        attivaDim4: false,
        attivaDim5: false,
        colore: null,
        categoriaIva: null,
        categoriaEconomica: null,
        tipoParte: null,
        aziendaPiva: null,
        prezzoBase: 0.0,
        costoBase: 0.0,
        gestitoMag: false,
        magazzino: null,
        magazzinoAcq: null,
        magazzinoVen: null,
        magazzinoProd: null,
        giacenza: null,
        disponibilita: null,
        disponibilitaTot: null,
        gestitoUbicazione: false,
        ubicazione: null,
        gestitoLotto: false,
        lotto: null,
        gestitoMatricola: false,
        matricola: null,
        cliente: null,
        fornitoreAbituale: null,
        updCostoBase: false,
        updCostoBaseForzatura: false,
      ),
      tipoRiga: null,
      destDes: null,
      destInd: null,
      pagamento: null,
      scontoPag: 0.0,
      sc1Tes: 0.0,
      sc2Tes: 0.0,
      sc3Tes: 0.0,
      cigCup: null,
      codIvaTes: null,
      colli: 0.0,
      qta: params['quantita'],
      qtaEvasa: 0.0,
      qtaResidua: 0.0,
      qtaGiacenza: 0.0,
      qtaInserita: 0.0,
      iva: 0.0,
      sconto1: 0.0,
      sconto2: 0.0,
      sconto3: 0.0,
      sconto4: 0.0,
      sconto5: 0.0,
      sconto6: 0.0,
      magg1: 0.0,
      magg2: 0.0,
      magg3: 0.0,
      magg4: 0.0,
      magg5: 0.0,
      magg6: 0.0,
      prezzo: 0.0,
      moltPrz: 0.0,
      prezzoUni: 0.0,
      nettoRiga: 0.0,
      dtOraIni: params['durataIni'],
      dtOraFin: params['durataFin'],
      operatore: params['operatore'],
      saldaRiga: false,
      dataRichConsegna: null,
      dataConfConsegna: null,
      note: null,
      noteDaStampare: null,
      origine: null,
      matricola: null,
      gestioneLotti: false,
      dtOraIns: dtOraIns,
      recordCancellato: false,
      recordSelezionato: false,
      recordInviato: false,
      info: null,
      warning: null,
      error: null,
      matricole: null,
      lotti: null, 
      docId: resultMapDocId['docId'],
    );

    intervento.righe.add(nuovaRiga);

    intervento.isDirty = true;

    state = intervento;

                            var interventiDbProvider =
                        ref.read(interventiDbRepositoryProvider.notifier);

  interventiDbProvider.saveChanges(state);
  }


void addRigaQuantita(Articolo? item, Map<String, dynamic> params, Map<String, dynamic> resultMapDocId) {
    DateTime now = DateTime.now();

    String? formattedDateTime = "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)} ${_twoDigits(now.hour)}:${_twoDigits(now.minute)}:${_twoDigits(now.second)}";
      DateTime dtOraIns = DateTime.parse(formattedDateTime);

    var intervento = state;
    int countRighe = state.righe.length;
    int rigaAdd = countRighe + 1; 

    var nuovaRiga = Riga(
      id: null,
      idTestata: intervento.idTestata,
      idRiga: null,
      numOrdine: null,
      riga: rigaAdd,
      descrizione: params['note'],
      barcode: null,
      statusEvasione: null,
      articolo: InterventoArticolo(
        id: item?.id,
        idListino: null,
        codice: item?.codice,
        descrizione: item?.descrizione,
        barcode: null,
        servizio: null,
        umPrincipale: item?.unimis.codice,
        umProduzione: null,
        tipoArt: null,
        sottotipoArt: null,
        settore: null,
        gruppo: null,
        sottogruppo: null,
        marca: null,
        sagoma: null,
        modello: null,
        serie: null,
        caratteristica: null,
        codArtFornitore: null,
        gestitoDimensioni: false,
        dimensione1: null,
        dimensione2: null,
        dimensione3: null,
        dimensione4: null,
        dimensione5: null,
        attivaDim1: false,
        attivaDim2: false,
        attivaDim3: false,
        attivaDim4: false,
        attivaDim5: false,
        colore: null,
        categoriaIva: null,
        categoriaEconomica: null,
        tipoParte: null,
        aziendaPiva: null,
        prezzoBase: 0.0,
        costoBase: 0.0,
        gestitoMag: false,
        magazzino: null,
        magazzinoAcq: null,
        magazzinoVen: null,
        magazzinoProd: null,
        giacenza: null,
        disponibilita: null,
        disponibilitaTot: null,
        gestitoUbicazione: false,
        ubicazione: null,
        gestitoLotto: false,
        lotto: null,
        gestitoMatricola: false,
        matricola: null,
        cliente: null,
        fornitoreAbituale: null,
        updCostoBase: false,
        updCostoBaseForzatura: false,
      ),
      tipoRiga: null,
      destDes: null,
      destInd: null,
      pagamento: null,
      scontoPag: 0.0,
      sc1Tes: 0.0,
      sc2Tes: 0.0,
      sc3Tes: 0.0,
      cigCup: null,
      codIvaTes: null,
      colli: 0.0,
      qta: params['quantita'],
      qtaEvasa: 0.0,
      qtaResidua: 0.0,
      qtaGiacenza: 0.0,
      qtaInserita: 0.0,
      iva: 0.0,
      sconto1: 0.0,
      sconto2: 0.0,
      sconto3: 0.0,
      sconto4: 0.0,
      sconto5: 0.0,
      sconto6: 0.0,
      magg1: 0.0,
      magg2: 0.0,
      magg3: 0.0,
      magg4: 0.0,
      magg5: 0.0,
      magg6: 0.0,
      prezzo: 0.0,
      moltPrz: 0.0,
      prezzoUni: 0.0,
      nettoRiga: 0.0,
      dtOraIni: params['durataIni'],
      dtOraFin: params['durataFin'],
      operatore: params['operatore'],
      saldaRiga: false,
      dataRichConsegna: null,
      dataConfConsegna: null,
      note: null,
      noteDaStampare: null,
      origine: null,
      matricola: null,
      gestioneLotti: false,
      dtOraIns: dtOraIns,
      recordCancellato: false,
      recordSelezionato: false,
      recordInviato: false,
      info: null,
      warning: null,
      error: null,
      matricole: null,
      lotti: null,
      docId: resultMapDocId['docId']
    );

    intervento.righe.add(nuovaRiga);
    intervento.isDirty = true;
    state = intervento;

    var interventiDbProvider = ref.read(interventiDbRepositoryProvider.notifier);

  interventiDbProvider.saveChanges(state);
  }

String _twoDigits(int n) {
  if (n >= 10) return "$n";
  return "0$n";
}



void updateRigaQuantita(Riga riga, double? nuovaQuantita, WidgetRef ref) {
  final int? index = riga.riga;

  if (index! >= 0 && index - 1 < state.righe.length) {
    state.righe[index].qta = nuovaQuantita;
    
    state.isDirty = true;

    var interventiDbProvider = ref.read(interventiDbRepositoryProvider.notifier);
    interventiDbProvider.saveChanges(state);
    
  } else {
    print('Riga non trovata');
  }
}




void addOrUpdateNota(Map<String, dynamic> params) {
  
    int countRighe = state.righe.length;
    int rigaAdd = countRighe + 1; 

    DateTime now = DateTime.now();

    String? formattedDateTime = "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)} ${_twoDigits(now.hour)}:${_twoDigits(now.minute)}:${_twoDigits(now.second)}";
      DateTime dtOraIns = DateTime.parse(formattedDateTime);

  var nuovaRiga = Riga(
                            id: null,
                            idTestata: null,
                            idRiga: null,
                            numOrdine: null,
                            riga: rigaAdd,
                            descrizione: params['note'],
                            barcode: null,
                            statusEvasione: null,
                            articolo: InterventoArticolo(
                              id: null,
                              idListino: null,
                              codice: null,
                              descrizione: null,
                              barcode: null,
                              servizio: null,
                              umPrincipale: null,
                              umProduzione: null,
                              tipoArt: null,
                              sottotipoArt: null,
                              settore: null,
                              gruppo: null,
                              sottogruppo: null,
                              marca: null,
                              sagoma: null,
                              modello: null,
                              serie: null,
                              caratteristica: null,
                              codArtFornitore: null,
                              gestitoDimensioni: false,
                              dimensione1: null,
                              dimensione2: null,
                              dimensione3: null,
                              dimensione4: null,
                              dimensione5: null,
                              attivaDim1: false,
                              attivaDim2: false,
                              attivaDim3: false,
                              attivaDim4: false,
                              attivaDim5: false,
                              colore: null,
                              categoriaIva: null,
                              categoriaEconomica: null,
                              tipoParte: null,
                              aziendaPiva: null,
                              prezzoBase: 0.0,
                              costoBase: 0.0,
                              gestitoMag: false,
                              magazzino: null,
                              magazzinoAcq: null,
                              magazzinoVen: null,
                              magazzinoProd: null,
                              giacenza: null,
                              disponibilita: null,
                              disponibilitaTot: null,
                              gestitoUbicazione: false,
                              ubicazione: null,
                              gestitoLotto: false,
                              lotto: null,
                              gestitoMatricola: false,
                              matricola: null,
                              cliente: null,
                              fornitoreAbituale: null,
                              updCostoBase: false,
                              updCostoBaseForzatura: false,
                            ),
                            tipoRiga: null,
                            destDes: null,
                            destInd: null,
                            pagamento: null,
                            scontoPag: 0.0,
                            sc1Tes: 0.0,
                            sc2Tes: 0.0,
                            sc3Tes: 0.0,
                            cigCup: null,
                            codIvaTes: null,
                            colli: 0.0,
                            qta: 0.0,
                            qtaEvasa: 0.0,
                            qtaResidua: 0.0,
                            qtaGiacenza: 0.0,
                            qtaInserita: 0.0,
                            iva: 0.0,
                            sconto1: 0.0,
                            sconto2: 0.0,
                            sconto3: 0.0,
                            sconto4: 0.0,
                            sconto5: 0.0,
                            sconto6: 0.0,
                            magg1: 0.0,
                            magg2: 0.0,
                            magg3: 0.0,
                            magg4: 0.0,
                            magg5: 0.0,
                            magg6: 0.0,
                            prezzo: 0.0,
                            moltPrz: 0.0,
                            prezzoUni: 0.0,
                            nettoRiga: 0.0,
                            dtOraIni: null,
                            dtOraFin: null,
                            operatore: params['operatore'],
                            saldaRiga: false,
                            dataRichConsegna: null,
                            dataConfConsegna: null,
                            note: null,
                            noteDaStampare: null,
                            origine: null,
                            matricola: null,
                            gestioneLotti: false,
                            dtOraIns: dtOraIns,
                            recordCancellato: false,
                            recordSelezionato: false,
                            recordInviato: false,
                            info: null,
                            warning: null,
                            error: null,
                            matricole: null,
                            lotti: null, 
                            docId: 0,
                          );

  state.righe.add(nuovaRiga);

  state.isDirty = true;
                        var interventiDbProvider =
                        ref.read(interventiDbRepositoryProvider.notifier);
  interventiDbProvider.saveChanges(state);
}

void removeRiga(WidgetRef ref, int numRiga) {
  int numIndex = numRiga -1;
  if (numIndex >= 0 && numIndex < state.righe.length) {
    state.righe.removeAt(numIndex);
    var interventiDbProvider = ref.read(interventiDbRepositoryProvider.notifier);
    interventiDbProvider.addOrUpdate(state);
  } else {
    print('Indice di riga non valido: $numRiga');
  }
}
}
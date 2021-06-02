import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'species_api_test.mocks.dart';
import 'package:faunatic_front_end/species_information.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchSpecies', () {
    final speciesList = SpeciesList();
    test('returns a SpeciesDetail if the http call completes successfully',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.https('group7-15.pvt.dsv.su.se', '/texts', {
        'id': 3.toString()
      }))).thenAnswer((_) async => http.Response(
          '{"swedishName":"trÃ¤spricklav","scientificName":"Acarospora anomala","speciesData":{"characteristicAsHtml":"TrÃ¤spricklav Ã¤r en skorplav med fjÃ¤llig, mÃ¶rkt brunrÃ¶d bÃ¥l. BÃ¥len bestÃ¥r av 0,5â1 mm stora bÃ¥lfjÃ¤ll som reagerar Câ. PÃ¥ varje bÃ¥lfjÃ¤ll finns enstaka, insÃ¤nkta, mÃ¶rkbruna, 0,1â0,4 mm breda apothecier som omges av en tydlig kant. Sporerna Ã¤r fÃ¤rglÃ¶sa, smÃ¥ (3â5 Ã 1,3â1,7 Âµm) och i varje sporsÃ¤ck finns upp till ett par hundra sporer. Hypotheciet reagerar Iâ. TrÃ¤spricklav vÃ¤xer ofta tillsammans med brun spricklav <i>A. fuscata</i> vilken dock har en nÃ¥got blekare bÃ¥l som reagerar C+ rÃ¶tt. Liten brunspricklav <i>A. <i>veronensis</i></i> Ã¤r ocksÃ¥ nÃ¥got lik men har nÃ¤stan kantlÃ¶sa apothecier och hypotheciet reagerar I+ blÃ¥tt. ","ecologyAsHtml":"Arten vÃ¤xer uteslutande pÃ¥ exponerade, gamla, ofta dammimpregnerade ekonomibyggnader och bostadshus. NÃ¤stan alltid fÃ¶rekommer den pÃ¥ gammalt virke mÃ¥lat med Falu rÃ¶dfÃ¤rg, ofta pÃ¥ dropplisten nÃ¤ra grunden. I Alperna Ã¤r den frÃ¤mst funnen pÃ¥ trÃ¤stÃ¶d fÃ¶r vinplantor. Vinplantorna sprutas med ett kopparhaltigt bekÃ¤mpningsmedel och den gemensamma faktorn fÃ¶r dessa substrat Ã¤r att det Ã¤r kopparhaltigt och sannolikt Ã¤r trÃ¤spricklav gynnad eller Ã¥tminstone inte skadad av detta. Arten Ã¤r en av de fÃ¥ spricklavar <i>Acarospora</i> som inte vÃ¤xer pÃ¥ sten utan bara Ã¤r funnen pÃ¥ ved. I Sverige Ã¤r tre spricklavar <i>Acarospora</i> funna pÃ¥ ved, fÃ¶rutom trÃ¤spricklav Ã¤ven brun spricklav <i>A. fuscata</i> och liten brunspricklav <i>A. <i>veronensis</i></i>. De tvÃ¥ senare vÃ¤xer dock nÃ¤stan alltid pÃ¥ sten. TrÃ¤spricklav vÃ¤xer ofta tillsammans med brun spricklav <i>A. fuscata</i>, Ã¤gglav <i>Candelariella vitellina</i> (ocksÃ¥ vanligen stenvÃ¤xande) och skrynkellav Parmelia sulcata. ","other":"Systematiken fÃ¶r slÃ¤ktet spricklavar Acarospora inklusive den hÃ¤r presenterade arten Ã¤r fortfarande ofullstÃ¤ndigt kÃ¤nd och bÃ¶r klargÃ¶ras. ","conservationMeasuresAsHtml":"","characteristicChangedDate":"2005-05-15T22:00:00Z","characteristic":"TrÃ¤spricklav Ã¤r en skorplav med fjÃ¤llig, mÃ¶rkt brunrÃ¶d bÃ¥l. BÃ¥len bestÃ¥r av 0,5â1 mm stora bÃ¥lfjÃ¤ll som reagerar Câ. PÃ¥ varje bÃ¥lfjÃ¤ll finns enstaka, insÃ¤nkta, mÃ¶rkbruna, 0,1â0,4 mm breda apothecier som omges av en tydlig kant. Sporerna Ã¤r fÃ¤rglÃ¶sa, smÃ¥ (3â5 Ã 1,3â1,7 Âµm) och i varje sporsÃ¤ck finns upp till ett par hundra sporer. Hypotheciet reagerar Iâ. TrÃ¤spricklav vÃ¤xer ofta tillsammans med brun spricklav A. fuscata vilken dock har en nÃ¥got blekare bÃ¥l som reagerar C+ rÃ¶tt. Liten brunspricklav A. veronensis Ã¤r ocksÃ¥ nÃ¥got lik men har nÃ¤stan kantlÃ¶sa apothecier och hypotheciet reagerar I+ blÃ¥tt. ","spreadAndStatusAsHtml":"","conservationMeasures":"Trots att mycket fÃ¥ aktuella lokaler finns Ã¤r ingen lokal skyddad. NÃ¥gra lokaler mÃ¥ste skyddas och fÃ¥ skÃ¶tselfÃ¶reskrifter som gynnar arten. Man bÃ¶r hÃ¤r bevara och Ã¥terskapa lÃ¤mpliga miljÃ¶er fÃ¶r arten. Det inkluderar att byggnader bara sÃ¤llan mÃ¥las och dÃ¥ med tunn Falu rÃ¶dfÃ¤rg. De delar av byggnader som har trÃ¤spricklav bÃ¶r inte Ã¶vermÃ¥las. ","otherAsHtml":"Systematiken fÃ¶r slÃ¤ktet spricklavar <i>Acarospora</i> inklusive den hÃ¤r presenterade arten Ã¤r fortfarande ofullstÃ¤ndigt kÃ¤nd och bÃ¶r klargÃ¶ras. ","ecology":"Arten vÃ¤xer uteslutande pÃ¥ exponerade, gamla, ofta dammimpregnerade ekonomibyggnader och bostadshus. NÃ¤stan alltid fÃ¶rekommer den pÃ¥ gammalt virke mÃ¥lat med Falu rÃ¶dfÃ¤rg, ofta pÃ¥ dropplisten nÃ¤ra grunden. I Alperna Ã¤r den frÃ¤mst funnen pÃ¥ trÃ¤stÃ¶d fÃ¶r vinplantor. Vinplantorna sprutas med ett kopparhaltigt bekÃ¤mpningsmedel och den gemensamma faktorn fÃ¶r dessa substrat Ã¤r att det Ã¤r kopparhaltigt och sannolikt Ã¤r trÃ¤spricklav gynnad eller Ã¥tminstone inte skadad av detta. Arten Ã¤r en av de fÃ¥ spricklavar Acarospora som inte vÃ¤xer pÃ¥ sten utan bara Ã¤r funnen pÃ¥ ved. I Sverige Ã¤r tre spricklavar Acarospora funna pÃ¥ ved, fÃ¶rutom trÃ¤spricklav Ã¤ven brun spricklav A. fuscata och liten brunspricklav A. veronensis. De tvÃ¥ senare vÃ¤xer dock nÃ¤stan alltid pÃ¥ sten. TrÃ¤spricklav vÃ¤xer ofta tillsammans med brun spricklav A. fuscata, Ã¤gglav Candelariella vitellina (ocksÃ¥ vanligen stenvÃ¤xande) och skrynkellav Parmelia sulcata. ","conservationMeasuresChangedDate":"2005-05-15T22:00:00Z","spreadAndStatus":"TrÃ¤spricklav Ã¤r funnen pÃ¥ drygt 10-tal gamla lokaler i Uppland, VÃ¤stmanland, VÃ¤stergÃ¶tland och Dalarna. Vid en inventering 1990-95 av sju gamla lokaler Ã¥terfanns den bara pÃ¥ en, men den hittades samtidigt pÃ¥ tvÃ¥ nya lokaler. Detta indikerar en kraftig tillbakagÃ¥ng. DÃ¤refter har den hittats pÃ¥ nÃ¥gra nya lokaler i Dalarna och fÃ¶r nÃ¤rvarande finns det hÃ¶gst ett 10-tal aktuella lokaler. 1997 hittades den pÃ¥ en ny lokal i Upplands skÃ¤rgÃ¥rd men redan nÃ¥gra mÃ¥nader senare renoverades huset och laven fÃ¶rsvann. I Ã¶vriga Norden Ã¤r den endast funnen i Finland. I Ã¶vrigt Ã¤r arten endast kÃ¤nd frÃ¥n enstaka lokaler i Alperna. ","threatAsHtml":"Gamla ekonomibyggnader och bostadshus med tunn, gammal Falu rÃ¶dfÃ¤rg kring odlad mark blir allt ovanligare. Vid inventeringen 1990-1995 fanns vid alla gamla lokaler fortfarande byggnader mÃ¥lade med Falu rÃ¶dfÃ¤rg men det fanns inga eller mycket fÃ¥ lavar vÃ¤xande pÃ¥ fÃ¤rgen. DÃ¤remot fanns pÃ¥ nÃ¥gra gamla lokaler nyligen mÃ¥lade byggnader dÃ¤r det gick att urskilja lavar, bl.a. obestÃ¤mbara spricklavar <i>Acarospora</i> under fÃ¤rgen. Det minskande antalet byggnader mÃ¥lade med Falu rÃ¶dfÃ¤rg Ã¤r dÃ¤rfÃ¶r knappast det stÃ¶rsta hotet utan det Ã¤r att nu mÃ¥las byggnader betydligt oftare och med betydligt tjockare fÃ¤rglager Ã¤n tidigare. Sannolikt Ã¤r ocksÃ¥ asfaltering av vÃ¤gar som minskar dammimpregnering ett hot. Endast pÃ¥ lokaler med dammimpregnering har vÃ¤lmÃ¥ende bÃ¥lar hittats. ","spreadAndStatusChangedDate":"2005-05-15T22:00:00Z","ecologyChangedDate":"2005-05-15T22:00:00Z","threatChangedDate":"2005-05-15T22:00:00Z","threat":"Gamla ekonomibyggnader och bostadshus med tunn, gammal Falu rÃ¶dfÃ¤rg kring odlad mark blir allt ovanligare. Vid inventeringen 1990-1995 fanns vid alla gamla lokaler fortfarande byggnader mÃ¥lade med Falu rÃ¶dfÃ¤rg men det fanns inga eller mycket fÃ¥ lavar vÃ¤xande pÃ¥ fÃ¤rgen. DÃ¤remot fanns pÃ¥ nÃ¥gra gamla lokaler nyligen mÃ¥lade byggnader dÃ¤r det gick att urskilja lavar, bl.a. obestÃ¤mbara spricklavar Acarospora under fÃ¤rgen. Det minskande antalet byggnader mÃ¥lade med Falu rÃ¶dfÃ¤rg Ã¤r dÃ¤rfÃ¶r knappast det stÃ¶rsta hotet utan det Ã¤r att nu mÃ¥las byggnader betydligt oftare och med betydligt tjockare fÃ¤rglager Ã¤n tidigare. Sannolikt Ã¤r ocksÃ¥ asfaltering av vÃ¤gar som minskar dammimpregnering ett hot. Endast pÃ¥ lokaler med dammimpregnering har vÃ¤lmÃ¥ende bÃ¥lar hittats. ","otherChangedDate":"2005-05-15T22:00:00Z"},"imageURL":"https://assets.artdatabanken.se/image/_4/1143_3_4.jpg"}',
          200));

      expect(await speciesList.getSpeciesDetailCall(client, 3),
          isA<SpeciesDetail>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://group7-15.pvt.dsv.su.se/texts?id=3')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(speciesList.getSpeciesDetailCall(client, 3), throwsException);
    });

    test('returns a list of Species if the http call completes successfully',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get(Uri.https('group7-15.pvt.dsv.su.se', '/search', {
        'term': 'träspricklav'
      }))).thenAnswer((_) async => http.Response(
          '[{"taxonId":3,"swedishName":"trÃ¤spricklav","scientificName":"Acarospora anomala"}]',
          200));

      expect(await speciesList.speciesSearchResult(client, 'träspricklav'),
          isA<List<Specie>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.https('group7-15.pvt.dsv.su.se', '/search', {'term': 'träspricklav'})))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(speciesList.speciesSearchResult(client, 'träspricklav'),
          throwsException);
    });
  });
}

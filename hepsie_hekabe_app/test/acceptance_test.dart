import 'package:flutter_test/flutter_test.dart';
import 'package:hepsie_hekabe_domain/domain.dart';
import 'package:hepsie_hekabe_infrastructure/infrastructure.dart';
import 'package:mockito/mockito.dart';

void main() {
  group('Acceptance Tests', () {
    test('Should give verses When asked for poetry', () {
      final poetryReader = PoetryReader();

      final verses = poetryReader.giveMeSomePoetry();

      expect(verses,
          'If you could read a leaf or tree\nyou’d have no need of books.\n-- © Alistair Cockburn (1987)');
    });

    test('Should give verses from a PoetryLibrary', () {
      final poetryLibrary = PoetryLibraryMock();
      when(poetryLibrary.getAPoem()).thenReturn(
          'I want to sleep\nSwat the flies\nSoftly, please.\n\n-- Masaoka Shiki (1867-1902)');
      final poetryReader = PoetryReader.create(poetryLibrary);

      final verses = poetryReader.giveMeSomePoetry();

      expect(verses,
          'I want to sleep\nSwat the flies\nSoftly, please.\n\n-- Masaoka Shiki (1867-1902)');
    });

    test('Should give different verses When using a PoemsLibraryFileAdapter',
        () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      final fileAdapater = PoemFileAdapter('assets/rimbaud.txt');
      final poetryReader = PoetryReader.create(fileAdapater);

      await Future<void>.delayed(const Duration());

      final verses = poetryReader.giveMeSomePoetry();
      expect(verses,
          "Comme je descendais des Fleuves impassibles,\nJe ne me sentis plus guidé par les haleurs :\nDes Peaux-Rouges criards les avaient pris pour cibles,\nLes ayant cloués nus aux poteaux de couleurs.\n\nJ'étais insoucieux de tous les équipages,\nPorteur de blés flamands ou de cotons anglais.\nQuand avec mes haleurs ont fini ces tapages,\nLes Fleuves m'ont laissé descendre où je voulais.\n\nDans les clapotements furieux des marées,\nMoi, l'autre hiver, plus sourd que les cerveaux d'enfants,\nJe courus ! Et les Péninsules démarrées\nN'ont pas subi tohu-bohus plus triomphants.\n\nLa tempête a béni mes éveils maritimes.\nPlus léger qu'un bouchon j'ai dansé sur les flots\nQu'on appelle rouleurs éternels de victimes,\nDix nuits, sans regretter l'oeil niais des falots !\n\nPlus douce qu'aux enfants la chair des pommes sûres,\nL'eau verte pénétra ma coque de sapin\nEt des taches de vins bleus et des vomissures\nMe lava, dispersant gouvernail et grappin.\n\nEt dès lors, je me suis baigné dans le Poème\nDe la Mer, infusé d'astres, et lactescent,\nDévorant les azurs verts ; où, flottaison blême\nEt ravie, un noyé pensif parfois descend ;\n\nOù, teignant tout à coup les bleuités, délires\nEt rhythmes lents sous les rutilements du jour,\nPlus fortes que l'alcool, plus vastes que nos lyres,\nFermentent les rousseurs amères de l'amour !\n\nJe sais les cieux crevant en éclairs, et les trombes\nEt les ressacs et les courants : je sais le soir,\nL'Aube exaltée ainsi qu'un peuple de colombes,\nEt j'ai vu quelquefois ce que l'homme a cru voir !\n\nJ'ai vu le soleil bas, taché d'horreurs mystiques,\nIlluminant de longs figements violets,\nPareils à des acteurs de drames très antiques\nLes flots roulant au loin leurs frissons de volets !\n\nJ'ai rêvé la nuit verte aux neiges éblouies,\nBaiser montant aux yeux des mers avec lenteurs,\nLa circulation des sèves inouïes,\nEt l'éveil jaune et bleu des phosphores chanteurs !\n\nJ'ai suivi, des mois pleins, pareille aux vacheries\nHystériques, la houle à l'assaut des récifs,\nSans songer que les pieds lumineux des Maries\nPussent forcer le mufle aux Océans poussifs !\n\nJ'ai heurté, savez-vous, d'incroyables Florides\nMêlant aux fleurs des yeux de panthères à peaux\nD'hommes ! Des arcs-en-ciel tendus comme des brides\nSous l'horizon des mers, à de glauques troupeaux !\n\nJ'ai vu fermenter les marais énormes, nasses\nOù pourrit dans les joncs tout un Léviathan !\nDes écroulements d'eaux au milieu des bonaces,\nEt les lointains vers les gouffres cataractant !\n\nGlaciers, soleils d'argent, flots nacreux, cieux de braises !\nÉchouages hideux au fond des golfes bruns\nOù les serpents géants dévorés des punaises\nChoient, des arbres tordus, avec de noirs parfums !\n\nJ'aurais voulu montrer aux enfants ces dorades\nDu flot bleu, ces poissons d'or, ces poissons chantants.\n- Des écumes de fleurs ont bercé mes dérades\nEt d'ineffables vents m'ont ailé par instants.\n\nParfois, martyr lassé des pôles et des zones,\nLa mer dont le sanglot faisait mon roulis doux\nMontait vers moi ses fleurs d'ombre aux ventouses jaunes\nEt je restais, ainsi qu'une femme à genoux...\n\nPresque île, ballottant sur mes bords les querelles\nEt les fientes d'oiseaux clabaudeurs aux yeux blonds.\nEt je voguais, lorsqu'à travers mes liens frêles\nDes noyés descendaient dormir, à reculons !\n\nOr moi, bateau perdu sous les cheveux des anses,\nJeté par l'ouragan dans l'éther sans oiseau,\nMoi dont les Monitors et les voiliers des Hanses\nN'auraient pas repêché la carcasse ivre d'eau ;\n\nLibre, fumant, monté de brumes violettes,\nMoi qui trouais le ciel rougeoyant comme un mur\nQui porte, confiture exquise aux bons poètes,\nDes lichens de soleil et des morves d'azur ;\n\nQui courais, taché de lunules électriques,\nPlanche folle, escorté des hippocampes noirs,\nQuand les juillets faisaient crouler à coups de triques\nLes cieux ultramarins aux ardents entonnoirs ;\n\nMoi qui tremblais, sentant geindre à cinquante lieues\nLe rut des Béhémots et les Maelstroms épais,\nFileur éternel des immobilités bleues,\nJe regrette l'Europe aux anciens parapets !\n\nJ'ai vu des archipels sidéraux ! et des îles\nDont les cieux délirants sont ouverts au vogueur :\n- Est-ce en ces nuits sans fonds que tu dors et t'exiles,\nMillion d'oiseaux d'or, ô future Vigueur ?\n\nMais, vrai, j'ai trop pleuré ! Les Aubes sont navrantes.\nToute lune est atroce et tout soleil amer :\nL'âcre amour m'a gonflé de torpeurs enivrantes.\nÔ que ma quille éclate ! Ô que j'aille à la mer !\n\nSi je désire une eau d'Europe, c'est la flache\nNoire et froide où vers le crépuscule embaumé\nUn enfant accroupi plein de tristesse, lâche\nUn bateau frêle comme un papillon de mai.\n\nJe ne puis plus, baigné de vos langueurs, ô lames,\nEnlever leur sillage aux porteurs de cotons,\nNi traverser l'orgueil des drapeaux et des flammes,\nNi nager sous les yeux horribles des pontons.");
    });
  });
}

class PoetryLibraryMock extends Mock implements IObtainsPoems {}

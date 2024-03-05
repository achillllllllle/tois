puts "Clearing existing data..."





# Destroy de toute les instances
User.destroy_all()
Category.destroy_all()
Toi.destroy_all()
Post.destroy_all()
ToiArtist.destroy_all()
Artist.destroy_all()


puts "Creating users..."

User.create!(email: "test@test.com", password:"azerty", username:"testuser")

24.times do ||
  User.create!(
    email: "#{Faker::Internet.email}",
    password: "123456",
    username: "#{Faker::Name.name}"
  )
end

puts "#{User.count} users created successfully!"


puts "Creating categories..."

['Cinema', 'Spectacle', 'Litterature', 'Exposition'].each do |category_name|
  Category.create!(name: category_name)
end

puts "#{Category.count} categories created sucessfully!"


TITLE_MOVIE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER = {
  "Le Fantôme de l'Opéra" => {
    title: "Le Fantôme de l'Opéra",
    cinema_description: "Une histoire intemporelle de séduction et de désespoir. Le Fantôme, vivant dans les catacombes de l'Opéra de Paris, utilise ses pouvoirs pour aider la jeune soprano Christine à devenir une étoile. Cette sombre et romantique histoire captive le public avec ses belles mélodies et son récit dramatique.",
    cinema_trailer: "https://www.youtube.com/watch?v=n6jCJZEFIto"
  },
  "Hamilton" => {
    title: "Hamilton",
    cinema_description: "Une comédie musicale américaine qui mélange hip hop, jazz, R&B et Broadway pour raconter l'histoire d'Alexander Hamilton, l'un des pères fondateurs de l'Amérique. Sa technique narrative innovante, sa musique et la diversité de son casting ont été saluées pour avoir insufflé une nouvelle vie à Broadway.",
    cinema_trailer: "https://www.youtube.com/watch?v=DSCKfXpAGHc"
  },
  "Cirque du Soleil : O" => {
    title: "Cirque du Soleil : O",
    cinema_description: "Une tapisserie aquatique d'art, de surréalisme et de romance théâtrale dans la production intemporelle 'O'. Les artistes du spectacle se lancent dans un voyage aquatique de fantaisie et d'illusion, intégrant sans effort l'acrobatie, la plongée et la natation.",
    cinema_trailer: "https://www.youtube.com/watch?v=OvoT7W2E-_Y"
  },
  "Wicked" => {
    title: "Wicked",
    cinema_description: "L'histoire inédite des sorcières d'Oz. 'Wicked' raconte l'histoire d'une femme à la peau verte nommée Elphaba, qui devient la méchante sorcière de l'Ouest. Ce spectacle captivant explore les thèmes de l'amitié, de l'amour et de l'intrigue politique.",
    cinema_trailer: "https://www.youtube.com/watch?v=3g4ekwTd6Ig"
  },
  "Les Misérables" => {
    title: "Les Misérables",
    cinema_description: "Un récit épique de passion et de destruction dans la France du 19e siècle. 'Les Misérables' raconte l'histoire de Jean Valjean, un ancien condamné qui devient une force de bien dans le monde mais ne peut échapper à son passé criminel.",
    cinema_trailer: "https://www.youtube.com/watch?v=YmvHzCLP6ug"
  },
  "Le Roi Lion" => {
    title: "Le Roi Lion",
    cinema_description: "Une histoire vibrante et excitante de la savane africaine. 'Le Roi Lion' donne vie à l'histoire de Simba, un jeune prince lion qui se lance dans un voyage pour comprendre son destin royal. Des visuels époustouflants et des chansons encadrent ce conte intemporel de famille et de pardon.",
    cinema_trailer: "https://www.youtube.com/watch?v=7TavVZMewpY"
  },
  "Groupe Blue Man" => {
    title: "Groupe Blue Man",
    cinema_description: "Une performance dynamique et innovante qui combine musique, technologie et comédie pour créer une forme de divertissement qui défie la catégorisation et qui plaît aux gens de tous âges.",
    cinema_trailer: "https://www.youtube.com/watch?v=YLluFt0G88w"
  },
  "Le Livre de Mormon" => {
    title: "Le Livre de Mormon",
    cinema_description: "Une comédie musicale satirique qui suit deux missionnaires mormons alors qu'ils tentent de prêcher la foi aux habitants d'un village reculé de l'Ouganda. Le spectacle est connu pour ses paroles intelligentes, sa musique entraînante et sa prise humoristique sur les thèmes et croyances religieuses.",
    cinema_trailer: "https://www.youtube.com/watch?v=OKkLV1zE8M0"
  },
  "Avatar" => {
    title: "Avatar",
    cinema_description: "Sur la luxuriante planète alien de Pandora vivent les Na'vi, des êtres qui semblent primitifs mais sont hautement évolués. L'environnement de la planète étant toxique, des hybrides humains/Na'vi, appelés Avatars, doivent se lier aux esprits humains pour permettre un mouvement libre sur Pandora.",
    cinema_trailer: "https://www.youtube.com/watch?v=5PSNL1qE6VY"
  },
  "E.T. l'extra-terrestre" => {
    title: "E.T. l'extra-terrestre",
    cinema_description: "Un enfant en difficulté trouve le courage d'aider un alien sympathique à s'échapper de la Terre et à retourner dans son monde natal.",
    cinema_trailer: "https://www.youtube.com/watch?v=qYAETtIIClk"
  },
  "Casablanca" => {
    title: "Casablanca",
    cinema_description: "Se déroulant pendant la Seconde Guerre mondiale, il se concentre sur un expatrié américain qui doit choisir entre son amour pour une femme et l'aider, elle et son mari, un leader de la Résistance tchèque, à s'échapper de la ville de Casablanca contrôlée par Vichy pour continuer sa lutte contre les nazis.",
    cinema_trailer: "https://www.youtube.com/watch?v=BkL9l7qovsE"
  },
  "Retour vers le futur" => {
    title: "Retour vers le futur",
    cinema_description: "Un jeune homme est accidentellement envoyé trente ans dans le passé dans une DeLorean capable de voyager dans le temps, inventée par son ami, le Dr Emmett Brown, et doit s'assurer que ses parents, alors adolescents, se réunissent afin de sauvegarder sa propre existence.",
    cinema_trailer: "https://www.youtube.com/watch?v=qvsgGtivCgs"
  },
  "Le Seigneur des Anneaux : La Communauté de l'Anneau" => {
    title: "Le Seigneur des Anneaux : La Communauté de l'Anneau",
    cinema_description: "Un jeune hobbit, Frodon, est poussé dans une quête épique pour détruire l'Anneau Unique, créé par le Seigneur des Ténèbres Sauron pour conquérir les terres de la Terre du Milieu.",
    cinema_trailer: "https://www.youtube.com/watch?v=V75dMMIW2B4"
  },
  "Les Dents de la mer" => {
    title: "Les Dents de la mer",
    cinema_description: "Un grand requin blanc mangeur d'hommes attaque les baigneurs sur Amity Island, poussant le chef de la police locale à le chasser avec l'aide d'un biologiste marin et d'un chasseur de requins professionnel.",
    cinema_trailer: "https://www.youtube.com/watch?v=U1fu_sA7XhE"
  },
  "Gladiator" => {
    title: "Gladiator",
    cinema_description: "Un ancien général romain se lance dans une quête de vengeance contre l'empereur corrompu qui a assassiné sa famille et l'a envoyé en esclavage.",
    cinema_trailer: "https://www.youtube.com/watch?v=owK1qxDselE"
  },
  "Il faut sauver le soldat Ryan" => {
    title: "Il faut sauver le soldat Ryan",
    cinema_description: "Après le débarquement en Normandie, un groupe de soldats américains passe derrière les lignes ennemies pour récupérer un parachutiste dont les frères ont été tués au combat.",
    cinema_trailer: "https://www.youtube.com/watch?v=zwhP5b4tD6g"
  },
  "Les Aventuriers de l'Arche perdue" => {
    title: "Les Aventuriers de l'Arche perdue",
    cinema_description: "L'archéologue Indiana Jones est engagé par le gouvernement américain pour trouver l'Arche d'alliance avant qu'Adolf Hitler et les nazis ne puissent obtenir ses pouvoirs extraordinaires.",
    cinema_trailer: "https://www.youtube.com/watch?v=XkkzKHCx154"
  },
  "Le Silence des agneaux" => {
    title: "Le Silence des agneaux",
    cinema_description: "Une jeune recrue du FBI doit solliciter l'aide d'un tueur en série cannibale incarcéré et manipulateur pour attraper un autre tueur en série, un fou qui écorche ses victimes.",
    cinema_trailer: "https://www.youtube.com/watch?v=W6Mm8Sbe__o"
  },
  "La Liste de Schindler" => {
    title: "La Liste de Schindler",
    cinema_description: "Dans la Pologne occupée par les Allemands pendant la Seconde Guerre mondiale, l'industriel Oskar Schindler devient progressivement préoccupé par sa main-d'œuvre juive après avoir été témoin de leur persécution par les nazis.",
    cinema_trailer: "https://www.youtube.com/watch?v=gG22XNhtnoY"
  },
  "Toy Story" => {
    title: "Toy Story",
    cinema_description: "Une poupée de cowboy se sent profondément menacée et jalouse lorsqu'une nouvelle figurine d'astronaute le supplante comme jouet préféré dans la chambre d'un garçon.",
    cinema_trailer: "https://www.youtube.com/watch?v=KYz2wyBy3kc"
  },
  "Psychose" => {
    title: "Psychose",
    cinema_description: "Une secrétaire de Phoenix détourne quarante mille dollars de son employeur, prend la fuite et s'enregistre dans un motel isolé tenu par un jeune homme sous la domination de sa mère.",
    cinema_trailer: "https://www.youtube.com/watch?v=DTJQfFQ40lI"
  },
  "Autant en emporte le vent" => {
    title: "Autant en emporte le vent",
    cinema_description: "Une femme manipulatrice et un homme voyou mènent une romance turbulente pendant la guerre civile américaine et la période de reconstruction.",
    cinema_trailer: "https://www.youtube.com/watch?v=0X94oZgJis4"
  }
}


TITLE_SPECTACLE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER = {
  "Cirque du Soleil: Alegria" => {
    cinema_description: "Un classique intemporel du Cirque du Soleil, 'Alegria' plonge le public dans un univers de fantaisie et de performance époustouflante, mêlant acrobaties, musique et danse dans un spectacle magique.",
    cinema_trailer: "https://www.youtube.com/watch?v=OZflc7tx8_E"
  },
  "Notre-Dame de Paris" => {
    cinema_description: "Basé sur le roman de Victor Hugo, ce spectacle musical raconte l'histoire tragique de Quasimodo et Esmeralda à Paris au 15ème siècle. Une production épique alliant puissance vocale, chorégraphie impressionnante et décors somptueux.",
    cinema_trailer: "https://www.youtube.com/watch?v=YPZtRmx1Dyk"
  },
  "Le Roi Lion - Comédie Musicale" => {
    cinema_description: "Adaptation sur scène du célèbre cinema_film d'animation de Disney, 'Le Roi Lion' est une comédie musicale qui transporte les spectateurs dans la savane africaine avec des costumes spectaculaires, des décors innovants et une musique envoûtante.",
    cinema_trailer: "https://www.youtube.com/watch?v=7TavVZMewpY"
  },
  "Les Misérables - Comédie Musicale" => {
    cinema_description: "Cette adaptation du roman classique de Victor Hugo est une des comédies musicales les plus célèbres au monde, racontant les luttes et les rêves de Jean Valjean dans la France post-révolutionnaire.",
    cinema_trailer: "https://www.youtube.com/watch?v=IddP8AAIGTQ"
  },
  "Ballet de l'Opéra National de Paris: Lac des Cygnes" => {
    cinema_description: "Le 'Lac des Cygnes', interprété par le Ballet de l'Opéra National de Paris, est un chef-d'œuvre intemporel qui captive le public avec sa musique de Tchaïkovski et sa danse classique émouvante.",
    cinema_trailer: "https://www.youtube.com/watch?v=9rJoB7y6Ncs"
  },
  "Holiday on Ice" => {
    cinema_description: "Un spectacle sur glace époustouflant qui combine patinage artistique de haut niveau, costumes éblouissants et décors magiques pour créer une expérience inoubliable pour toute la famille.",
    cinema_trailer: "https://www.youtube.com/watch?v=xezqM57Vm3s"
  },
  "Mamma Mia! - Comédie Musicale" => {
    cinema_description: "Basée sur les chansons d'ABBA, cette comédie musicale joyeuse raconte l'histoire d'un mariage sur une île grecque, un secret familial et la recherche de l'identité, le tout enveloppé dans les hits intemporels d'ABBA.",
    cinema_trailer: "https://www.youtube.com/watch?v=unfzfe8f9NI"
  },
  "Phantom of the Opera à Broadway" => {
    cinema_description: "Le 'Fantôme de l'Opéra' à Broadway est la production emblématique du célèbre roman, mettant en scène l'histoire d'amour tragique entre un compositeur défiguré et une jeune soprano dans l'Opéra de Paris.",
    cinema_trailer: "https://www.youtube.com/watch?v=44w6elsJr_I"
  },
  "Grease - Comédie Musicale" => {
    cinema_description: "L'histoire d'amour emblématique entre Danny Zuko et Sandy Olsson, sur fond de rock'n'roll des années 50. 'Grease' est une célébration de la jeunesse, de l'amour et des voitures, avec des numéros musicaux qui ont traversé les générations.",
    cinema_trailer: "https://www.youtube.com/watch?v=wzWmxjYNfz4"
  },
  "Billy Elliot - Le Musical" => {
    cinema_description: "Dans une ville minière anglaise, un jeune garçon découvre sa passion pour la danse classique, contre les souhaits de son père. 'Billy Elliot' est une histoire inspirante de lutte et de triomphe, avec une musique émouvante d'Elton John.",
    cinema_trailer: "https://www.youtube.com/watch?v=JoiVEyCosEE"
  },
  "Chicago - Le Musical" => {
    cinema_description: "Ambition, trahison, meurtre et jazz. 'Chicago' raconte l'histoire de Roxie Hart et Velma Kelly, deux meurtrières dans le Chicago des années 1920, qui deviennent des célébrités dans leur quête de liberté.",
    cinema_trailer: "https://www.youtube.com/watch?v=8IxcfbldgBY"
  },
  "Cats - Comédie Musicale" => {
    cinema_description: "Un spectacle magique qui transporte le public dans un monde mystique peuplé de chats. Avec sa musique envoûtante d'Andrew Lloyd Webber, 'Cats' est un spectacle visuellement spectaculaire et une prouesse chorégraphique.",
    cinema_trailer: "https://www.youtube.com/watch?v=FtSd844cI7U"
  },
  "West Side Story - Comédie Musicale" => {
    cinema_description: "Une adaptation moderne de 'Roméo et Juliette'. 'West Side Story' est l'histoire d'un amour impossible entre Tony et Maria, sur fond de rivalités entre gangs dans le New York des années 50.",
    cinema_trailer: "https://www.youtube.com/watch?v=yA_aFprGzyc"
  },
  "Le Cirque Invisible" => {
    cinema_description: "Jean-Baptiste Thierrée et Victoria Chaplin vous invitent dans leur monde féerique où le cirque se mêle à la magie. 'Le Cirque Invisible' est une expérience unique, un spectacle où l'imagination n'a pas de limites.",
    cinema_trailer: "https://www.youtube.com/watch?v=KVJn2lJ6aAk"
  },
  "Stomp" => {
    cinema_description: "Un spectacle rythmique explosif qui utilise des objets du quotidien pour créer un univers sonore incroyable. 'Stomp' est une expérience percussive à couper le souffle, mêlant musique, danse et performance théâtrale.",
    cinema_trailer: "https://www.youtube.com/watch?v=tZ7aYQtIldg"
  },
  "Le Bourgeois Gentilhomme" => {
    cinema_description: "La comédie-ballet de Molière et Lully revient à la vie dans cette production éclatante, racontant l'histoire de Monsieur Jourdain, un bourgeois qui aspire à devenir gentilhomme.",
    cinema_trailer: "https://www.youtube.com/watch?v=2JgOvn2N9bI"
  },
  "Fuerza Bruta" => {
    cinema_description: "Un spectacle avant-gardiste qui brise la barrière entre le public et les performeurs. 'Fuerza Bruta' est une expérience immersive où la musique, la danse et les acrobaties se rencontrent dans un espace où tout est possible.",
    cinema_trailer: "https://www.youtube.com/watch?v=IbFhj4M9lu4"
  },
  "Swan Lake - Ballet" => {
    cinema_description: "Le célèbre ballet de Tchaïkovski, 'Le Lac des Cygnes', est un conte de fées qui raconte l'histoire d'amour tragique entre le prince Siegfried et la princesse Odette, maudite à vivre comme un cygne le jour.",
    cinema_trailer: "https://www.youtube.com/watch?v=9rJoB7y6Ncs"
  },
  "KÀ by Cirque du Soleil" => {
    cinema_description: "Une aventure épique qui unit acrobaties, arts martiaux, marionnettes et multimédia pour raconter l'histoire d'un voyage héroïque. 'KÀ' est une expérience visuelle à couper le souffle, exclusive au MGM Grand Las Vegas.",
    cinema_trailer: "https://www.youtube.com/watch?v=SEVU-YLpM8A"
  },
  "Sleep No More" => {
    cinema_description: "Une expérience théâtrale immersive inspirée de 'Macbeth' de Shakespeare. 'Sleep No More' est une représentation unique où le public se déplace librement à travers un espace théâtral gothique, devenant ainsi partie intégrante de la narration.",
    cinema_trailer: "https://www.youtube.com/watch?v=C2pH2VbOcFg"
  }
}

TITLE_LITTERATURE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER = {
  "Gatsby le Magnifique" => {
    description: "L'histoire de Jay Gatsby, un millionnaire mystérieux qui poursuit passionnément la belle Daisy Buchanan, reflétant les illusions du rêve américain et la haute société des années 1920.",
    trailer: "https://www.youtube.com/watch?v=rARN6agiW7o"
  },
  "Ne tirez pas sur l'oiseau moqueur" => {
    description: "Dans le sud ségrégationniste des États-Unis, Atticus Finch, un avocat intègre, défend un homme noir accusé à tort de viol, enseignant à ses enfants des leçons précieuses sur la justice et l'empathie.",
    trailer: "https://www.youtube.com/watch?v=KR7loA_oziY"
  },
  "Orgueil et Préjugés" => {
    description: "L'histoire d'Elizabeth Bennet et de M. Darcy, deux personnes très différentes qui surmontent les malentendus et les différences de classe sociale pour découvrir l'amour véritable dans l'Angleterre du 19e siècle.",
    trailer: "https://www.youtube.com/watch?v=fJA27Jujzq4"
  },
  "Harry Potter à l'école des sorciers" => {
    description: "Harry Potter découvre qu'il est le fils de deux sorciers puissants et qu'il possède des pouvoirs magiques uniques. À l'école de sorcellerie de Poudlard, il trouve l'amitié et le courage face au sorcier maléfique Voldemort.",
    trailer: "https://www.youtube.com/watch?v=VyHV0BRtdxo"
  },
  "Le Seigneur des Anneaux: La Communauté de l'Anneau" => {
    description: "Frodon Sacquet, un jeune hobbit, hérite d'un anneau magique aux pouvoirs immenses. Avec l'aide de ses amis, il doit entreprendre un voyage périlleux pour détruire l'anneau et empêcher le mal de s'emparer du monde.",
    trailer: "https://www.youtube.com/watch?v=V75dMMIW2B4"
  },
  "Les Jeux de la Faim" => {
    description: "Dans un futur dystopique, Katniss Everdeen se porte volontaire pour remplacer sa sœur dans les Hunger Games, une compétition télévisée où les participants doivent se battre à mort. Son courage changera le destin de la nation.",
    trailer: "https://www.youtube.com/watch?v=mfmrPu43DF8"
  },
  "Autant en emporte le vent" => {
    description: "L'histoire épique de Scarlett O'Hara et de Rhett Butler pendant la guerre civile américaine et la reconstruction, explorant l'amour, la guerre, la passion et la perte dans le sud des États-Unis.",
    trailer: "https://www.youtube.com/watch?v=0X94oZgJis4"
  },
  "Les Évadés" => {
    description: "Basé sur la nouvelle de Stephen King, ce film suit l'histoire d'Andy Dufresne, un banquier injustement condamné à la prison à vie, qui trouve l'espoir et l'humanité dans les murs sombres de Shawshank.",
    trailer: "https://www.youtube.com/watch?v=6hB3S9bIaco"
  },
  "Jurassic Park" => {
    description: "Adapté du roman de Michael Crichton, Jurassic Park est une aventure palpitante sur une île où des dinosaures génétiquement recréés s'échappent, mettant en péril la vie des visiteurs du parc.",
    trailer: "https://www.youtube.com/watch?v=QWBKEmWWL38"
  },
  "Fight Club" => {
    description: "Un homme insatisfait de sa vie consumériste forme un club de combat souterrain avec Tyler Durden, un vendeur de savon charismatique, plongeant dans une spirale de violence. Le film est une critique acerbe de la société moderne.",
    trailer: "https://www.youtube.com/watch?v=qtRKdVHc-cE"
  },
  "Les Misérables" => {
    description: "L'adaptation cinématographique du roman de Victor Hugo et de la comédie musicale, racontant l'histoire de Jean Valjean, un ex-convict cherchant la rédemption dans la France post-révolutionnaire, tout en étant poursuivi par l'inspecteur Javert.",
    trailer: "https://www.youtube.com/watch?v=IuEFm84s4oI"
  },
  "L'Odyssée de Pi" => {
    description: "Après un naufrage, Pi Patel se retrouve sur un canot de sauvetage avec un tigre du Bengale. Au cours de leur voyage extraordinaire, Pi découvre la force de la volonté et le pouvoir de l'histoire.",
    trailer: "https://www.youtube.com/watch?v=j9Hjrs6WQ8M"
  },
  "Le Parrain" => {
    description: "Le patriarche vieillissant d'une dynastie du crime organisé transfère le contrôle de son empire clandestin à son fils réticent. Adapté du roman de Mario Puzo, ce film est une saga épique sur la famille, le pouvoir et la loyauté.",
    trailer: "https://www.youtube.com/watch?v=sY1S34973zA"
  },
  "La Liste de Schindler" => {
    description: "L'histoire vraie d'Oskar Schindler, un industriel allemand qui a sauvé la vie de plus de mille Juifs polonais pendant l'Holocauste en les employant dans ses usines.",
    trailer: "https://www.youtube.com/watch?v=gG22XNhtnoY"
  },
  "Forrest Gump" => {
    description: "Forrest Gump, un homme aux capacités mentales limitées, mais au cœur pur, traverse des moments historiques des États-Unis au 20e siècle, influençant la vie de ceux qu'il rencontre grâce à sa naïveté désarmante.",
    trailer: "https://www.youtube.com/watch?v=bLvqoHBptjg"
  },
  "Le Silence des Agneaux" => {
    description: "Clarice Starling, une jeune agente du FBI, doit solliciter l'aide d'Hannibal Lecter, un psychiatre emprisonné et cannibale, pour attraper un autre tueur en série. Une plongée terrifiante dans l'esprit de la folie.",
    trailer: "https://www.youtube.com/watch?v=W6Mm8Sbe__o"
  },
  "Da Vinci Code" => {
    description: "Robert Langdon, symbologiste, est entraîné dans une chasse au trésor à travers des monuments historiques, sur la piste d'un secret qui pourrait remettre en question les fondements du christianisme.",
    trailer: "https://www.youtube.com/watch?v=zMba3fckhuQ"
  },
  "Le Labyrinthe" => {
    description: "Des adolescents sont piégés dans un labyrinthe géant et doivent s'associer pour trouver une issue. Basé sur le roman de James Dashner, c'est une histoire de survie, de leadership et de courage face à l'inconnu.",
    trailer: "https://www.youtube.com/watch?v=AwwbhhjQ9Xk"
  },
  "Divergente" => {
    description: "Dans une société dystopique divisée en cinq factions basées sur les vertus humaines, Tris Prior découvre qu'elle est Divergente et ne rentre dans aucune faction, la mettant en danger de mort.",
    trailer: "https://www.youtube.com/watch?v=sutgWjz10sM"
  }
}

TITLE_EXPOSITION_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER = {
  "Van Gogh : Peint avec des Mots" => {
    description: "Un voyage cinématographique dans la vie de Vincent Van Gogh, raconté à travers ses lettres à son frère Théo, révélant l'homme derrière les toiles emblématiques.",
    trailer: "https://www.youtube.com/watch?v=6a8Eimr-fm0"
  },
  "Frida" => {
    description: "La vie passionnée de Frida Kahlo, peinte à travers son art, son amour tumultueux avec Diego Rivera et sa lutte personnelle, dans un portrait vibrant de l'artiste.",
    trailer: "https://www.youtube.com/watch?v=uOUzQYqba4Y"
  },
  "Les Impressionnistes" => {
    description: "L'histoire des pionniers de l'art moderne, les Impressionnistes, et comment ils ont révolutionné la peinture, présentée à travers une série documentaire captivante.",
    trailer: "https://www.youtube.com/watch?v=5ZAxZQ0_-mk"
  },
  "Léonard de Vinci : L'Œuvre" => {
    description: "Une exploration cinématographique des œuvres de Léonard de Vinci, offrant un regard intime sur les peintures et dessins du maître de la Renaissance.",
    trailer: "https://www.youtube.com/watch?v=v7uRFVR9BPU"
  },
  "La Jeune Fille à la Perle" => {
    description: "Inspiré par le mystérieux tableau de Vermeer, ce film explore l'histoire derrière la création de l'une des œuvres d'art les plus célèbres au monde.",
    trailer: "https://www.youtube.com/watch?v=IERZr6Lcuyo"
  },
  "Aimer Vincent" => {
    description: "Le premier long métrage peint à la main au monde, qui explore la vie et les œuvres controversées de Vincent Van Gogh à travers les yeux des personnes qui l'ont connu.",
    trailer: "https://www.youtube.com/watch?v=CGzKnyhYDQI"
  },
  "Klimt & Schiele : Eros et Psyché" => {
    description: "Revisitant l'époque érotique et psychologique de Vienne de 1900 à travers les œuvres de Gustav Klimt et Egon Schiele dans une exposition captivante.",
    trailer: "https://www.youtube.com/watch?v=BrVnc0xwvZ4"
  },
  "Basquiat : La Rage de la Richesse" => {
    description: "Une plongée profonde dans la vie de Jean-Michel Basquiat, suivant son ascension fulgurante dans le monde de l'art new-yorkais des années 80 et son héritage durable.",
    trailer: "https://www.youtube.com/watch?v=3Ms1RQxB5F8"
  },
  "Munch 150" => {
    description: "Célébrant le 150e anniversaire de la naissance d'Edvard Munch, cette exposition rassemble le plus grand nombre d'œuvres de Munch jamais présentées.",
    trailer: "https://www.youtube.com/watch?v=frSED6XBRzE"
  },
  "Le Jardin de l'Artiste : L'Impressionnisme Américain" => {
    description: "Explorant l'Impressionnisme Américain à travers l'objectif des jardins d'artistes, ce documentaire offre un aperçu de l'intersection de l'art, du jardinage et de l'histoire sociale.",
    trailer: "https://www.youtube.com/watch?v=Ys7mP68_Mds"
  },
  "Les Nymphéas de Monet : La Magie de l'Eau et de la Lumière" => {
    description: "Découvrez comment les Nymphéas de Monet ont révolutionné l'art moderne, à travers une exploration de son œuvre ultime au sein de l'Orangerie Museum à Paris.",
    trailer: "https://www.youtube.com/watch?v=7Zn95OF_D3M"
  },
  "Picasso : Amour, Sexe et Art" => {
    description: "Un regard sur la vie de Pablo Picasso, avec un accent particulier sur ses muses, ses amours et son impact sur l'art du 20e siècle.",
    trailer: "https://www.youtube.com/watch?v=3GmJ11G5bP4"
  },
  "Gauguin : Voyage à Tahiti" => {
    description: "Suivez Paul Gauguin dans son voyage à Tahiti, une quête de liberté, d'évasion et d'inspiration loin de la civilisation occidentale.",
    trailer: "https://www.youtube.com/watch?v=9MrnAJsxL8c"
  },
  "Degas : Passion pour la Perfection" => {
    description: "À travers une série d'expositions et de collections privées, découvrez la quête de la perfection d'Edgar Degas et son impact sur l'art moderne.",
    trailer: "https://www.youtube.com/watch?v=ZjgBQ2tDufI"
  },
  "Michel-Ange : Amour et Mort" => {
    description: "Une exploration de la vie et des œuvres de Michel-Ange, révélant les luttes et les succès de l'un des plus grands artistes de la Renaissance.",
    trailer: "https://www.youtube.com/watch?v=0FG6NXFkF3k"
  },
  "Raphaël : Le Seigneur des Arts" => {
    description: "Plongez dans la vie de Raphaël, un génie de la Renaissance, dont les œuvres continuent d'influencer l'art mondial des siècles après sa mort.",
    trailer: "https://www.youtube.com/watch?v=9vHFsXOdTt0"
  },
  "Turner : Peintures de Lumière" => {
    description: "L'histoire de J.M.W. Turner, dont les peintures révolutionnaires ont capturé la beauté transitoire de la lumière et annoncé l'ère de l'impressionnisme.",
    trailer: "https://www.youtube.com/watch?v=Tn4zSR_5ioI"
  },
  "Vermeer : L'Âge d'Or de l'Art Hollandais" => {
    description: "Découvrez Johannes Vermeer, le maître de la lumière, dont les peintures intimes et détaillées offrent un aperçu fascinant de la vie quotidienne au 17e siècle.",
    trailer: "https://www.youtube.com/watch?v=FTtW0Jq9f5I"
  },
  "Le Monde de Banksy" => {
    description: "Une immersion dans l'univers mystérieux de Banksy, l'artiste de rue le plus célèbre au monde, connu pour ses œuvres provocatrices et politiquement engagées.",
    trailer: "https://www.youtube.com/watch?v=9R5VwxvUUvI"
  },
  "Warhol : L'Art du Pop" => {
    description: "Un regard sur la vie et l'œuvre d'Andy Warhol, figure emblématique du Pop Art, dont l'approche novatrice a changé la perception de l'art.",
    trailer: "https://www.youtube.com/watch?v=U3YFgZj6zUw"
  },
  "Kandinsky : Un Voyage vers l'Abstraction" => {
    description: "Explorez le voyage de Wassily Kandinsky vers l'abstraction, un mouvement qui a bouleversé l'art traditionnel et ouvert la voie à une nouvelle forme d'expression.",
    trailer: "https://www.youtube.com/watch?v=tiX_Af33vN8"
  },
  "Magritte : Ceci n'Est Pas une Pipe" => {
    description: "Une exploration de l'œuvre de René Magritte, maître du surréalisme, dont les images trompeuses et les idées philosophiques ont défié la réalité.",
    trailer: "https://www.youtube.com/watch?v=h6lLQb6Z8Ho"
  },
  "Hopper : Fenêtres sur la Solitude" => {
    description: "Edward Hopper, peintre de la solitude moderne, capture l'isolement et la mélancolie à travers ses représentations emblématiques de la vie américaine.",
    trailer: "https://www.youtube.com/watch?v=SpMzoBR2Szo"
  },
  "L'Âge de Rembrandt" => {
    description: "Revivez l'âge d'or de la peinture hollandaise à travers l'œuvre de Rembrandt, dont les portraits et scènes bibliques révèlent une humanité profonde et une maîtrise de la lumière.",
    trailer: "https://www.youtube.com/watch?v=1pUWJGmN8ZU"
  }
}




def dynamic_content_for_toi(category_id)
  category = Category.find(category_id)

  # For cinema
  cinema_film = TITLE_MOVIE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER.keys.sample
  cinema_description = TITLE_MOVIE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[cinema_film][:cinema_description]
  cinema_trailer = TITLE_MOVIE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[cinema_film][:cinema_trailer_url]

  # For spectacle
  spectacle_film = TITLE_SPECTACLE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER.keys.sample
  spectacle_description = TITLE_SPECTACLE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[spectacle_film][:cinema_description]
  spectacle_trailer = TITLE_SPECTACLE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[spectacle_film][:cinema_trailer_url]

  # For litterature
  litterature_book = TITLE_LITTERATURE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER.keys.sample
  litterature_description = TITLE_LITTERATURE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[litterature_book][:description]
  litterature_trailer = TITLE_LITTERATURE_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[litterature_book][:trailer]

  # For exposition
  exposition_book = TITLE_EXPOSITION_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER.keys.sample
  exposition_description = TITLE_EXPOSITION_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[exposition_book][:description]
  exposition_trailer = TITLE_EXPOSITION_AND_CINEMA_DESCRIPTION_AND_CINEMA_TRAILER[exposition_book][:trailer]

 case category.name
  when "Cinema"
    {
      title: "cinema_film: #{cinema_film}",
      cinema_description: cinema_description,
      cinema_trailer: cinema_trailer,
      name: cinema_film

    }
  when "Spectacle"
    {
      title: "Spectacle: #{spectacle_film}",
      cinema_description: spectacle_description,
      cinema_trailer: spectacle_trailer,
      name: spectacle_film
    }
  when "Litterature"
    {
      title: "Livre: #{litterature_book}",
      cinema_description: litterature_description,
      cinema_trailer: litterature_trailer,
      name: litterature_book
    }
  when "Exposition"
    {
      title: "Expo: #{exposition_book}",
      cinema_description: exposition_description,
      cinema_trailer: exposition_trailer,
      name: Faker::Artist.name
    }
  else
    { title: "N/A", cinema_description: "N/A", cinema_trailer: "N/A" }
  end
end

puts "Creating tois..."

24.times do ||
  category = Category.order('RANDOM()').first
  content = dynamic_content_for_toi(category.id)

  Toi.create!(
    title: content[:title],
    category: category,
    location: Faker::Address.full_address,
    description: content[:cinema_description],
    trailer: content[:cinema_trailer]
  )
end

puts "#{Toi.count} tois created sucessfully!"

# puts "Creating posts..."

# 24.times do |i|
#   user = User.order('RANDOM()').first
#   toi = Toi.order('RANDOM()').first

#   Post.create!(
#     photo: "photo#{i}.jpg",
#     review: "Critique numéro #{i}",
#     rating: rand(1..10),
#     user_id: user.id,
#     toi_id: toi.id
#   )
# end
# puts "#{Post.count} posts created sucessfully!"

# puts "Creating artists..."

# 24.times do ||
#   category = Category.order('RANDOM()').first
#   content = dynamic_content_for_toi(category.id)

#    Artist.create!(
#     name: content[:name]
#   )
# end

# puts "#{Artist.count} artists created sucessfully!"

# puts "Creating toi_artists..."

# 24.times do ||
#   artist = Artist.order('RANDOM()').first
#   toi = Toi.order('RANDOM()').first

#    ToiArtist.create!(
#     artist: artist,
#     toi:toi
#   )
# end

# puts "#{ToiArtist.count} toi_artists created sucessfully!"

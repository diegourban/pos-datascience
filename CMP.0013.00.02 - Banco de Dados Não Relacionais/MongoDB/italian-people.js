(function() {
    let names = [
    "Marco", "Elena", "Ilaria", "Andrea", "Paola", "Gianni", "Giuseppe", "Stefania", "Pietro", 
    "Antonio", "Angela", "Valeira", "Luca", "Nicola", "Emanuele", "Alessandro", "Roberta", "Sabrina",
    "Anna", "Angelo", "Enrico", "Giovanni", "Cristina", "Serena", "Roberto", "Simona", "Veronica",
    "Stefano", "Elisa", "Pasquale", "Maria", "Alessia", "Mattia", "Sara", "Martina", "Raffaele", "Paolo",
    "Claudio", "Rosa", "Laura", "Lorenzo", "Filipo", "Michele", "Claudia", "Eleonora", "Fabio",
    "Monica", "Giacomo", "Davide", "Maurizio", "Rita", "Valentina", "Alessio", "Massimiliano",
    "Matteo", "Lucia", "Sergio", "Salvatore", "Barbara", "Tiziana", "Massimo", "Alberto", "Giorgia",
    "Daniele", "Federico", "Cinzia", "Giulia", "Gianluca", "Manuela", "Simone", "Riccardo", "Giusy",
    "Antonella", "Patrizia", "Sonia", "Chiara", "Domenico", "Cristian", "Luigi", "Carlo", "Marta",
    "Silvia", "Mauro", "Alex", "Mario", "Giovanna", "Emanuela", "Daniela", "Michela", "Dario",
    "Vincenzo", "Giorgio", "Mirko", "Federica", "Fabrizio", "Elisabetta", "Alessandra",
    "Gabiele", "Enzo ", "Teresa"
  ]

let surnames = [
    "Rossi",  "Vitale",  "Grassi", "Russo",  "Lombardo","Pellegrino", "Ferrari",  "Serra",
    "Carbone", "Esposito","Coppola",  "Giuliani", "Bianchi",  "De Santis",  "Benedetti", "Romano",
    "D’Angelo",  "Barone", "Colombo",  "Marchetti",  "Rossetti", "Ricci",  "Parisi",  "Caputo",
    "Marino",  "Villa",  "Montanari", "Greco",  "Conte",  "Guerra", "Bruno",  "Ferraro",  "Palmieri",
    "Gallo",  "Ferri",  "Bernardi", "Conti",  "Fabbri",  "Martino", "De Luca",  "Bianco",  "Fiore",
    "Mancini",  "Marini",  "De Rosa", "Costa",  "Grasso",  "Ferretti", "Giordano",  "Valentini",  "Bellini",
    "Rizzo",  "Messina",  "Basile", "Lombardi",  "Sala",  "Riva", "Moretti",  "De Angelis",  "Donati", "Barbieri", 
    "Gatti",  "Piras", "Fontana",  "Pellegrini",  "Vitali", "Santoro",  "Palumbo",  "Battaglia", "Mariani",
    "Sanna",  "Sartori", "Rinaldi",  "Farina",  "Neri", "Caruso",  "Rizzi",  "Costatini", "Ferrara",  "Monti", 
    "Milani", "Galli",  "Cattaneo",  "Pagano", "Martini",  "Morelli",  "Ruggiero", "Leone",  "Amato",  "Sorrentino",
    "Longo",  "Silvestri",  "D’Amico", "Gentile",  "Mazza",  "Orlando", "Martinelli",  "Testa",  "Damico",  "Negri"
]

let domains = [
    "@gmail.com", "@live.com", "@yahoo.com", "@hotmail.com", "@outlook.com", "@uol.com.br"
];

let bloodType = [
    "A", "B", "AB", "O"
];

let jobs = [
    "Administração Pública", "Agronegócios e Agropecuária", "Ciências Aeronáuticas", "Ciências Atuariais", "Ciências Contábeis",
    "Ciências Econômicas", "Comércio Exterior", "Defesa e Gestão Estratégica Internacional", "Gastronomia", "Gestão Comercial",
    "Gestão de Recursos Humanos", "Gestão de Segurança Privada", "Gestão de Seguros", "Gestão de Turismo", "Gestão Financeira",
    "Gestão Pública", "Hotelaria", "Logística", "Marketing", "Negócios Imobiliários", "Pilotagem profissional de aeronaves",
    "Processos Gerenciais", "Segurança Pública", "Turismo", "Artes e Design", "Animação", "Arquitetura e Urbanismo", "Artes Visuais", 
    "Comunicação das Artes do Corpo", "Conservação e Restauro", "Dança", "Design", "Design de Games", "Design de Interiores", "Design de Moda", 
    "Fotografia", "História da Arte", "Jogos Digitais", "Luteria", "Música", "Produção Cênica", "Produção Fonográfica", "Teatro", "Agroecologia", 
    "Agronomia", "Alimentos", "Biocombustíveis", "Biotecnologia", "Biotecnologia e Bioquímica", "Ciência e Tecnologia de Alimentos", "Ciências Agrárias", 
    "Ciências Biológicas", "Ciências Naturais e Exatas", "Ecologia", "Geofísica", "Geologia", "Gestão Ambiental", "Medicina Veterinária", "Meteorologia", 
    "Oceanografia", "Produção de Bebidas", "Produção Sucroalcooleira", "Rochas Ornamentais", "Zootecnia", "Ciências Exatas e Informática", "Análise e Desenvolvimento de Sistemas", 
    "Astronomia", "Banco de Dados", "Ciência da Computação", "Ciência e Tecnologia", "Computação", "Estatística", "Física", "Gestão da Tecnologia da Informação", "Informática Biomédica", 
    "Matemática", "Nanotecnologia", "Química", "Redes de Computadores", "Segurança da Informação", "Sistemas de Informação", "Sistemas para Internet", "Ciências Sociais e Humanas", "Arqueologia", 
    "Ciências do Consumo", "Ciências Humanas", "Ciências Sociais", "Cooperativismo", "Direito", "Escrita Criativa", "Estudos de Gênero e Diversidade", "Filosofia", "Geografia", "Gestão de Cooperativas", 
    "História", "Letras", "Libras", "Linguística", "Museologia", "Pedagogia", "Psicopedagogia", "Relações Internacionais", "Serviço Social", "Serviços Judiciários e Notariais", "Teologia", "Tradutor e Intérprete", 
    "Comunicação e Informação", "Arquivologia", "Biblioteconomia", "Cinema e Audiovisual", "Comunicação em Mídias Digitais", "Comunicação Institucional", "Comunicação Organizacional", "Educomunicação", "Estudos de Mídia", "Eventos", "Gestão da Informação", "Jornalismo", "Produção Audiovisual", "Produção Cultural", "Produção Editorial", "Produção Multimídia", "Produção Publicitária", "Publicidade e Propaganda", "Rádio, TV e Internet", "Relações Públicas", "Secretariado", "Secretariado Executivo", "Engenharia e Produção", "Agrimensura", "Aquicultura", "Automação Industrial", "Construção Civil", "Construção Naval", "Eletrônica Industrial", "Eletrotécnica Industrial", "Energias Renováveis", "Engenharia Acústica", "Engenharia Aeronáutica", "Engenharia Agrícola", "Engenharia Ambiental e Sanitária", "Engenharia Biomédica", "Engenharia Bioquímica, de Bioprocessos e Biotecnologia", "Engenharia Cartográfica e de Agrimensura", "Engenharia Civil", "Engenharia da Computação", "Engenharia de Alimentos", "Engenharia de Biossistemas", "Engenharia de Controle e Automação", "Engenharia de Energia", "Engenharia de Inovação", "Engenharia de Materiais", "Engenharia de Minas", "Engenharia de Pesca", "Engenharia de Petróleo", "Engenharia de Produção", "Engenharia de Segurança no Trabalho", "Engenharia de Sistemas", "Engenharia de Software", "Engenharia de Telecomunicações", "Engenharia de Transporte e da Mobilidade", "Engenharia Elétrica", "Engenharia Eletrônica", "Engenharia Física", "Engenharia Florestal", "Engenharia Hídrica", "Engenharia Industrial Madeireira", "Engenharia Mecânica", "Engenharia Mecatrônica", "Engenharia Metalúrgica", "Engenharia Naval", "Engenharia Nuclear", "Engenharia Química", "Engenharia Têxtil", "Fabricação Mecânica", "Geoprocessamento", "Gestão da Produção Industrial", "Gestão da Qualidade", "Irrigação e Drenagem", "Manutenção de aeronaves", "Manutenção Industrial (T/L)", "Materiais", "Mecatrônica Industrial", "Mineração", "Papel e Celulose", "Petróleo e Gás", "Processos Metalúrgicos", "Processos Químicos", "Produção Têxtil", "Saneamento Ambiental", "Segurança no Trabalho", "Silvicultura", "Sistemas Biomédicos", "Sistemas de Telecomunicações", "Sistemas Elétricos", "Sistemas Embarcados", "Transporte", "Saúde e Bem-estar", "Biomedicina", "Educação Física", "Enfermagem", "Esporte", "Estética e Cosmética", "Farmácia", "Fisioterapia", "Fonoaudiologia", "Gerontologia", "Gestão Desportiva e de Lazer", "Gestão em Saúde", "Gestão Hospitalar", "Medicina", "Musicoterapia", "Naturologia", "Nutrição", "Obstetrícia", "Odontologia", 
    "Oftálmica", "Optometria", "Psicologia", "Quiropraxia", "Radiologia", "Saúde Coletiva", "Terapia Ocupacional"
];

let fruits = [
    "Banana", "Maçã", "Kiwi", "Mamão", "Pêssego", "Uva", "Laranja", "Tangerina", "Goiaba", "Melancia"
];

let movies = [
    "Um Sonho de Liberdade (1994)", "O Poderoso Chefão (1972)", "Batman: O Cavaleiro das Trevas (2008)", "O Poderoso Chefão II (1974)",
    "O Senhor dos Anéis: O Retorno do Rei (2003)", "Pulp Fiction: Tempo de Violência (1994)", "A Lista de Schindler (1993)",
    "12 Homens e uma Sentença (1957)", "A Origem (2010)", "Clube da Luta (1999)", "O Senhor dos Anéis: A Sociedade do Anel (2001)",
    "Forrest Gump: O Contador de Histórias (1994)", "Três Homens em Conflito (1966)", "O Senhor dos Anéis: As Duas Torres (2002)",
    "Matrix (1999)", "Os Bons Companheiros (1990)", "Star Wars, Episódio V: O Império Contra-Ataca (1980)",
    "Um Estranho no Ninho (1975)", "Harakiri (1962)", "Coringa (2019)", "Parasita (2019)", "Interestelar (2014)", "Cidade de Deus (2002)",
    "A Viagem de Chihiro (2001)", "O Resgate do Soldado Ryan (1998)", "À Espera de um Milagre (1999)", "A Vida é Bela (1997)",
    "Seven: Os Sete Crimes Capitais (1995)", "O Silêncio dos Inocentes (1991)", "Guerra nas Estrelas (1977)", "Os Sete Samurais (1954)",
    "A Felicidade Não se Compra (1946)", "1917 (2019)", "Vingadores: Ultimato (2019)", "Intocáveis (2011)", "Gladiador (2000)"
];

let randName = function() {
    var n = names.length;
    return {
      firstname: names[Math.floor(Math.random() * names.length)],
      lastname: surnames[Math.floor(Math.random() * surnames.length)]
    };
}

let randBlood = function() {
    let rhFactor = ["+", "-"]
    return bloodType[Math.floor(Math.random() * bloodType.length)] + rhFactor[Math.floor(Math.random() * rhFactor.length)];
}

let randId = function() {
    let id = "";
    for (i=0; i< 12; i++ ) id += Math.floor(Math.random() * 9);
    return id;
}

function randomDate() {
    let start = new Date(2007, 0, 1);
    let end = new Date();
    return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}

let randAge = function(n) {
    return Math.floor(Math.random() * n);
}

let randjobs = function() {
    let jobsNumber = 1 + Math.floor(Math.random() * 2);
    let someoneJobs = [];
    for (let i=0; i < jobsNumber; i++) someoneJobs.push(jobs[Math.floor(Math.random() * jobs.length)]);
    return someoneJobs;
}

let randFruits = function() {
    let fruitsNumber = 1 + Math.floor(Math.random() * 3);
    let someoneFruits = [];
    for (let i=0; i < fruitsNumber; i++)  someoneFruits.push(fruits[Math.floor(Math.random() * fruits.length)]);
    return someoneFruits;
}

let randmovies = function() {
    let numMovies = 1 + Math.floor(Math.random() * 5);
    let someoneMovies = [];
    for (let i=0; i < numMovies; i++)  {
        someoneMovies.push( {"title": movies[Math.floor(Math.random() * movies.length)], "rating": Math.floor(Math.random() * 500)/100} );
    }
    return someoneMovies;
}

let randPerson = function(index) {
    let name = randName();
    var person = {
      firstname: name.firstname,
      surname: name.lastname,
      username: "user"+index,
      age: randAge(80),
      email: name.firstname + "." + name.lastname + domains[Math.floor(Math.random() * domains.length)],
      bloodType: randBlood(),
      id_num: randId(),
      registerDate: randomDate(),
      ticketNumber: Math.floor(Math.random() * 10000),
      jobs: randjobs(),
      favFruits: randFruits(),
      movies: randmovies()
    }

    if (Math.random() > 0.9) {
      person.mother = {
        firstname: names[Math.floor(Math.random() * names.length)],
        surname: name.lastname,
        age: person.age + 15 + randAge(18)
      }
    }

    if (Math.random() > 0.8) {
        person.father = {
          firstname: names[Math.floor(Math.random() * names.length)],
          surname: name.lastname,
          age: person.age + 15 + randAge(25)
        }
    }

    if (Math.random() > 0.4) {
        person.cat = {
          name: randName().firstname,
          age: randAge(18)
        }
    }

    if (Math.random() > 0.6) {
        person.dog = {
          name: randName().firstname,
          age: randAge(18)
        }
    }
  

    return person;
}

print("Generating People")

for (let i = 0; i < 10000; ++i) {
    let person = randPerson(i+100);

    printjson(person);
    let result = db.italians.insert(person);
    print(result);
    
};

})();

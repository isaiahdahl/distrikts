# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'

User.destroy_all
Score.destroy_all
Style.destroy_all
Question.destroy_all
Answer.destroy_all
UserAnswer.destroy_all
Distrikt.destroy_all
Match.destroy_all
City.destroy_all
Place.destroy_all
Review.destroy_all

puts "DESTROY DATABASE!!!"

def score_attrs
  {
      artsy: (40..100).to_a.sample,
      authentic: (40..100).to_a.sample,
      trendy: (40..100).to_a.sample,
      foodie: (40..100).to_a.sample,
      walkability: (40..100).to_a.sample,
      touristy: (40..100).to_a.sample,
      shopping: (40..100).to_a.sample,
      nightlife: (40..100).to_a.sample,
      outdoor: (40..100).to_a.sample,
      luxury: (40..100).to_a.sample,
      weather: (40..100).to_a.sample,
      zen: (40..100).to_a.sample
  }
end


def style_attrs
  {
  name: ["Urban Explorer", "Cultural Scavenger", "Cultural Explorer", "Urban Fisherman"].sample,
      description: "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla. Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
  }
end

30.times do
  password = Faker::Internet.password(8)
  score = Score.create(score_attrs)
  style = Style.create(style_attrs)
  style.score = Score.create(score_attrs)
  user = User.new(
      username: Faker::Internet.user_name,
      email: Faker::Internet.free_email,
      password: password,
      password_confirmation: password
  )
  user.style = style
  user.score = score
  user.save
end

cities = [
    {
        name: "New York",
        country: "USA",
        continent: "North America"
    },
    {
        name: "Tokyo",
        country: "Japan",
        continent: "Asia"
    },
    {
        name: "Paris",
        country: "France",
        continent: "Europe"
    },
    {
        name: "Rio de Janeiro",
        country: "Brazil",
        continent: "South America"
    },
]

cities.each do |attributes|
  City.create(attributes)
end

new_york_distrikts = [
    {
        name: "East Village",
        description: "Boasting the best of, well, everything, the East Village’s inexhaustible grid of beyond-hip bars, bookshops, cafes, clubs, and galleries cater to even the most exacting tastes. As stylish as it is, the East Village preserves a laid-back attitude so even outsiders feel welcome when in this classic New York City neighborhood. From early morning to late-late night, the East Village brims with activity for socialites and scaliwags alike.",
        outline: "[[-433.97403717041016,40.718704858576665],[-433.97257804870605,40.72540497175607],[-433.9718055725097,40.727291289709356],[-433.99060249328613,40.73483602685421],[-433.9906883239746,40.73086864241804],[-433.99163246154785,40.72982797782921],[-433.99635314941406,40.72514478577349],[-433.97403717041016,40.718704858576665]]"
    },
    {
        name: "Park Slope",
        description: "Park Slope is an idyllic Brooklyn neighborhood complete with immaculately maintained brownstones and well-behaved children. The families and professionals that share Park Slope are savvy and eco-friendly big-city dwellers with a refined neighborly sensibility. Easily accessible and self-sufficient, Park Slope’s main avenues are filled with boutiques, restaurants, and bars serving a crowd that expects nothing less than the crème de la crème.",
    },
    {
        name: "Soho",
        description: "Remarkably hip Soho welcomes a tirelessly fashionable crowd with a penchant for premium shopping. Renowned for its endless array of pricey boutiques and its charming atmosphere, this sought-after hotspot is famous for attracting cool celebrities and hot models to join its crowds. Away from the masses, Soho’s picturesque streets become quieter, but the youthful attitude of this trendy locale ensures there’s never an early bedtime.",
    },
    {
        name: "Times Square/Theatre District",
        description: "Depending on who you ask, Times Square/Theatre District is either the heart of New York City or a stress-inducing tourist trap. This unceasingly energetic area is a year-round hotspot for the throngs of visitors flocking to its flagship stores, only-on-Broadway productions, and iconic television studios. As one of NYC’s most frenetic neighborhoods, Times Square/Theatre District exemplifies \"bright lights, big city\" like nowhere else.",
    },
    {
        name: "Union Square",
        description: "A fine example of New York City’s unmatched diversity, Union Square brings together poets, professionals, protesters, and everyone in between. Anchored by its central plaza, Union Square extends into surrounding streets filled with a mix of corporate giants and neighborhood staples. Farmer’s markets and street performers add to Union Square’s cultural significance and popular appeal.",
    },
    {
        name: "Williamsburg",
        description: "Brunch and bike away the day and lounge and drink away the night in this infinitely hip warehouse-turned-loft Brooklyn neighborhood. New York City’s top spot for looking awesome while ordering beers that come in a tall can, Williamsburg is a food, drink, and music lover’s paradise. This ultra-trendy neighborhood completes its super cool repertoire with alternative-looking street art and two-story murals.",
    }
]

def new_york_photos
  [
      [

      ]
  ]
end

new_york_distrikts.each do |attributes|
  distrikt = Distrikt.new(attributes)
  city = City.where(name: "New York")
  score = Score.create(score_attrs)
  distrikt.city = city.first
  distrikt.score = score
  distrikt.photo_urls = urls
  distrikt.save
end

paris_distrikts = [
    {
        name: "Bastille",
        description: "Bastille represents Parisian romance—stylish, exotic strangers rub elbows in this dazzling, historical neighborhood. Its streetscapes cinema-worthy and its nightclubs legendary, Bastille’s centuries-old buildings share winding alleyways and broad promenades with ethnic eateries and avant-garde performance spaces, while its green spaces and gardens offer peaceful respites from the streets’ exuberant atmosphere. You won’t have trouble orienting yourself in this part of Paris—the July Column stands tall in the center of Place de la Bastille.",
    },
    {
        name: "Le Marais",
        description: "Often referred to as “Old Paris,” Le Marais exudes old-world charm and modern-day functionality in the city’s core. Cobblestone streets wind through Le Marais' dizzying network of hidden courtyards, provocative galleries, and ivy-covered boulangeries. The neighborhood’s meticulously styled aesthetic of painted windowpanes and antique relics is not an accident. Le Marais was well kept by its once thriving Jewish population, and its recent incarnation as an LGBTQ hotspot keeps it trim and tailored.",
    },
    {
        name: "Montmartre",
        description: "There’s a reason why Montmartre is always bustling. This iconic hilltop neighborhood’s striped awnings, cobblestone streets, and lively plazas rest at the foot of its pilgrimage-worthy basilica, Sacre Coeur. The neighborhood’s sacred structure and artisanal shops encourage frequent foot traffic, but Montmartre's ceaseless activity invites more than pleasure strollers along its cinema-worthy streets—entrepreneurial misfits add a picaresque slant to Montmartre’s picturesque street scenes.",
    },
    {
        name: "Opera",
        description: "Ionic columns and Art Nouveau palaces compose the lavish streetscapes of Opéra – Grands Boulevards  Exemplifying the height of Parisian style, the neighborhood’s famous department stores clothe forward-thinking fashionistas while the Garnier Opera House redefines high culture. Opéra – Grands Boulevards'  refined disposition extends far beyond its garments, tenors, and sopranos—this central Paris neighborhood’s also flaunts fastidious restaurants, impeccably designed spaces, sultry clubs, and a theatrical nightlife that keeps you on the edge of your seat.",
    },
    {
        name: "Pigalle",
        description: "Garter-belts, hazy rooms, and the iconic Moulin Rouge theatre perpetuate Pigalle – Saint-Georges’ racy reputation. Serving as Paris’ red-light district, this unapologetically coquettish neighborhood pursues more than deep pockets and affronting eroticism. Pigalle – Saint-Georges fosters other passions, too—Pablo Picasso and Vincent van Gogh both painted here, local artisans make culinary delights by hand, and dedicated musicians can find antique instruments in this neighborhood’s specialty shops. Daytime is welcome in Pigalle – Saint-Georges, but the neighborhood truly comes to life after dark.",
    },
    {
        name: "Saint-Germain-Des-Prés",
        description: "Whiling away the day at sidewalk cafes isn’t considered unproductive in Saint-Germain-des-Prés – Odeon... it’s considered the perfect afternoon. A former bohemian retreat, this central Paris neighborhood has since transformed into a destination for couture window-shopping and catered relaxation. Saint-Germain-des-Prés – Odeon’s ivy-covered art galleries, corner patisseries, and centuries-old churches only add to the neighborhood’s undeniable romance—the kind that requires quiet contemplation at a sidewalk café.",
    },

]

paris_distrikts.each do |attributes|
  distrikt = Distrikt.new(attributes)
  city = City.where(name: "Paris")
  score = Score.create(score_attrs)
  distrikt.city = city.first
  distrikt.score = score
  distrikt.save
end

rio_distrikts = [
    {
        name: "Barra da Tijuca",
        description: "Far-removed from the core of the city, Barra da Tijuca exchanges Rio de Janeiro’s traditional apartments and villas for chic condominiums and mega malls. This glass-towered neighborhood borrows its entertainment éclat from cosmopolitan hotspots like Miami, USA. Primped socialites gather in Barra da Tijuca’s glamorous boutiques and glitzy nightclubs. Its beauty goes beyond skin-deep—this neighborhood boasts scenic mountain vistas, the city’s longest stretch of beach, and the notoriety of being South America’s first city to host the Summer Olympics in 2016.",
    },
    {
        name: "Botafogo",
        description: "Lush tree coverage gives way to sandy beaches and sailboat-speckled seascapes in Botafogo. This neighborhood’s bayside location prevents its water from being as crystal clear as nearby Copacabana’s, but Botafogo makes up for its murkiness with breathtaking vistas of sea, sky, and Sugarloaf Mountain. More reserved than all-night neighborhoods like Ipanema, Botafogo is filled with traditional avenues of entertainment—museums, cafes, art house cinemas, and a commercial shopping complex complete Botafogo’s laid-back repertoire.",
    },
    {
        name: "Ipanema",
        description: "Ipanema shares a border with Copacabana, but this world-class beach destination is more poised than its south Rio counterpart. Like a samba that swings so cool, this neighborhood is known for culturally enriching contributions and nonstop parties. Ipanema is home to universities, art galleries, elegant restaurants, hip nightclubs, and a robust cafe culture. The neighborhood’s mix of vocations creates a colorful beachside dynamic—students, surfers, professionals, and a thriving LGBT population frequents its sandy banks.",
    },
    {
        name: "Lagoa",
        description: "Lagoa’s most stunning attribute is difficult to define. Sprawling under the wide embrace of Corcovado Mountain’s “Christ the Redeemer” statue, this south Rio neighborhood adds a placid blue lake to the city’s aquatic repertoire (as if the appeal of the Atlantic wasn’t enough). A veritable playground surrounds the lake, and Rio’s active residents hike, bike, and meditate along its banks, while the neighborhood’s modern high-rises and convenient kiosks provide recreational necessities and places to relax.",
    },
    {
        name: "Lapa",
        description: "Unlike many of Rio’s most popular destinations, Lapa is not revered for its beachfront real estate or bikini-clad models. Although this south Rio neighborhood claims a bit of coastline, Lapa is known for something much more sultry: its signature rhythm. Sounds of samba, forró, and choro emanate from Lapa’s packed nightclubs—establishments bursting with passionate self-expression and all-night energy. The neighborhood’s colonial aqueduct and colorful parks promise that its cultural richness extends beyond the evening.",
    },
    {
        name: "Vidigal",
        description: "Vidigal is emblematic of Rio’s challenging contrasts. Perching along the coast of the Atlantic, this artistic seaside neighborhood claims some of the world’s most sought-after real estate. Although Vidigal’s beauty is next to none, its hardships are real—the neighborhood is notorious as the site of illicit activities, turf wars, and dense disenfranchisement. Awash in color and burgeoning with potential, exploring Vidigal is best suited for savvy travelers.",
    },
]

rio_distrikts.each do |attributes|
  distrikt = Distrikt.new(attributes)
  city = City.where(name: "Rio de Janeiro")
  score = Score.create(score_attrs)
  distrikt.city = city.first
  distrikt.score = score
  distrikt.save
end

tokyo_distrikts = [
    {
        name: "Asakusa",
        description: "Find more locals than foreigners in Asakusa and Ueno, a taste of traditional Tokyo with a tinge of tourism. As the gracefully-worn area ages along with its residents, new shopping centers slip between street side parks and slowly replace peeling buildings. In Asakusa and Ueno, some things remain irreplaceable—Tokyo’s oldest temple, Senso-Ji, stands as a testament to the past and a tourist attraction in the present.",
    },
    {
        name: "Ginza",
        description: "Accessible by numerous subway lines, Ginza doesn't grant such effortless entry into its sophisticated establishments. Boasting some of the world's most upscale shopping, Ginza outfits Tokyo's designer-conscious clientele for extravagant outings to gallery openings and red carpet events. Like the chicest names in fashion, tech companies Sony, Nikon, and Apple choose to showcase their latest and greatest in Ginza as big spenders peruse the scene in pursuit of their next big purchase.",
    },
    {
        name: "Harajuku",
        description: "Just a 5-minute train ride from Shinjuku Station, Harajuku is the spot to see and be seen. From extreme teenage street styles to off-the-runway designs, Harajuku reigns as Japan's forward-thinking fashion capital. Window-shop at Omotesandō Avenue's international flagship stores or catwalk through alleyways that pop with polka-dots, plaid skirts, and neon high tops. If the wild pace and fluorescent lights of Harajuku begin to make you feel dizzy, find your center at nearby Yoyogi Park.",
    },
    {
        name: "Nakameguro",
        description: "Nestled within Meguro District, Nakameguro makes its own name. Only two stops from the incessant activity of Shibuya, Nakameguro exudes a laid-back attitude of the kind where shoppers browse without the pressure to buy and tables linger without the pressure to pay the bill. Leaf through art books suited for the coffee table or buy a vintage suit from a man in a van—Nakameguro’s understatedly European atmosphere enhances this sliver along the Meguro River.",
    },
    {
        name: "Shibuya",
        description: "A whirlwind at the heart of Shibuya District, Shibuya centers on the area’s namesake train station, Shibuya Station. By day, hautely dressed denizens flood out of the station and into Shibuya’s top department stores, trendy boutiques, and nearly-too-cool izakayas. By night, Shibuya’s sidewalks swell with chattering youth and the sounds of DJs spinning in suspended glass booths. Leaving the clamor behind means leaving Shibuya. Luckily, the surrounding district provides plenty of natural respites.",
    },
    {
        name: "Shimokitazawa",
        description: "A short train ride from Shinjuku Station drops you at the front stoops of Shimokitazawa, Tokyo's rising star of creative bohemian acclaim. Shimokitazawa shares Harajuku's highly stylized aesthetic, but it’s slightly removed from the masses that gather in the center of the city. Chaotic in a charming way, Shimokitazawa is more organic than organized—its roads are sinewy and nearly too narrow for cars, its architecture endearingly haphazard, and its look meticulously inelegant.",
    },
]

tokyo_distrikts.each do |attributes|
  distrikt = Distrikt.new(attributes)
  city = City.where(name: "Tokyo")
  score = Score.create(score_attrs)
  distrikt.city = city.first
  distrikt.score = score
  distrikt.save
end

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
TOKEN_PATH = "/oauth2/token"
GRANT_TYPE = "client_credentials"


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 7


def bearer_token
  # Put the url together
  url = "#{API_HOST}#{TOKEN_PATH}"


  # Build our params hash
  params = {
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["CLIENT_SECRET"],
      grant_type: GRANT_TYPE
  }

  response = HTTP.post(url, params: params)
  parsed = response.parse

  "#{parsed['token_type']} #{parsed['access_token']}"
end

def search(term, location)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
  }

  response = HTTP.auth(bearer_token).get(url, params: params)
  response.parse
end

Distrikt.all.each do |distrikt|
response = search("bar", "#{distrikt.name}")
  response["businesses"].each do |biz|
    place = Place.new(
        name: biz["name"],
        category: "nightlife",
        address: biz["location"]["display_address"].join(" "),
        phone: biz["phone"],
        img_url: biz["image_url"],
        distrikt_id: distrikt.id,
        score_id: ""
    )
    place.save
  end
end


Distrikt.all.each do |distrikt|
  response = search("club", "#{distrikt.name}")
  response["businesses"].each do |biz|
    place = Place.new(
        name: biz["name"],
        category: "nightlife",
        address: biz["location"]["display_address"].join(" "),
        phone: biz["phone"],
        img_url: biz["image_url"],
        distrikt_id: distrikt.id,
        score_id: ""
    )
    place.save
  end
end

questions = [{
                 description: "What does your weekend look like?",
                 order: 1
             },
             {
                 description: "Where do you see yourself?",
                 order: 2
             },
             {
                 description: "What is your beverage of choice?",
                 order: 3
             },
             {
                 description: "What kind of food do you prefer?",
                 order: 4
             }
]

questions.each do |question|
  Question.create(question)
end

answers = [{
               img_url: "q1_a1.jpg",
               question_id: 1
           },
           {
               img_url: "q1_a2.jpg",
               question_id: 1
           },
           {
               img_url: "q1_a3.jpg",
               question_id: 1
           },
           {
               img_url: "q1_a4.jpg",
               question_id: 1
           },
           {
               img_url: "q2_a1.jpg",
               question_id: 2
           },
           {
               img_url: "q2_a2.jpg",
               question_id: 2
           },
           {
               img_url: "q2_a3.jpg",
               question_id: 2
           },
           {
               img_url: "q2_a4.jpg",
               question_id: 2
           },
           {
               img_url: "q3_a1.jpg",
               question_id: 3
           },
           {
               img_url: "q3_a2.jpg",
               question_id: 3
           },
           {
               img_url: "q3_a3.jpg",
               question_id: 3
           },
           {
               img_url: "q3_a4.jpg",
               question_id: 3
           },
           {
               img_url: "q4_a1.jpg",
               question_id: 4
           },
           {
               img_url: "q4_a2.jpg",
               question_id: 4
           },
           {
               img_url: "q4_a3.jpg",
               question_id: 4
           },
           {
               img_url: "q4_a4.jpg",
               question_id: 4
           }
]

def q_score_attrs
  {
      artsy: (0..10).to_a.sample,
      authentic: (0..10).to_a.sample,
      trendy: (0..10).to_a.sample,
      foodie: (0..10).to_a.sample,
      walkability: (0..10).to_a.sample,
      touristy: (0..10).to_a.sample,
      shopping: (0..10).to_a.sample,
      nightlife: (0..10).to_a.sample,
      outdoor: (0..10).to_a.sample,
      luxury: (0..10).to_a.sample,
      weather: (0..10).to_a.sample,
      zen: (0..10).to_a.sample
  }
end


answers.each do |answer|
  score = Score.new(q_score_attrs)
  answer = Answer.new(answer)
  answer.score = score
  answer.save
end

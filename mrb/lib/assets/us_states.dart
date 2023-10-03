Map<String, List<String>> usStatesAndCities = {
  'Alabama': [
    '',
    'Birmingham',
    'Montgomery',
    'Huntsville',
    'Mobile',
    'Tuscaloosa'
  ],
  'Alaska': ['Anchorage', 'Fairbanks', 'Juneau', 'Sitka', 'Ketchikan'],
  'Arizona': ['Phoenix', 'Tucson', 'Mesa', 'Chandler', 'Glendale'],
  'Arkansas': [
    'Little Rock',
    'Fort Smith',
    'Fayetteville',
    'Springdale',
    'Jonesboro'
  ],
  'California': [
    'Los Angeles',
    'San Francisco',
    'San Diego',
    'San Jose',
    'Sacramento'
  ],
  'Colorado': [
    'Denver',
    'Colorado Springs',
    'Aurora',
    'Fort Collins',
    'Boulder'
  ],
  'Connecticut': [
    'Bridgeport',
    'New Haven',
    'Hartford',
    'Stamford',
    'Waterbury'
  ],
  'Delaware': ['Wilmington', 'Dover', 'Newark', 'Middletown', 'Smyrna'],
  'Florida': ['Miami', 'Tampa', 'Orlando', 'Jacksonville', 'St. Petersburg'],
  'Georgia': ['Atlanta', 'Augusta', 'Columbus', 'Savannah', 'Macon'],
  'Hawaii': ['Honolulu', 'Pearl City', 'Hilo', 'Kailua', 'Waipahu'],
  'Idaho': ['Boise', 'Nampa', 'Meridian', 'Idaho Falls', 'Pocatello'],
  'Illinois': ['Chicago', 'Aurora', 'Rockford', 'Joliet', 'Naperville'],
  'Indiana': [
    'Indianapolis',
    'Fort Wayne',
    'Evansville',
    'South Bend',
    'Carmel'
  ],
  'Iowa': [
    'Des Moines',
    'Cedar Rapids',
    'Davenport',
    'Sioux City',
    'Iowa City'
  ],
  'Kansas': ['Wichita', 'Overland Park', 'Kansas City', 'Topeka', 'Olathe'],
  'Kentucky': [
    'Louisville',
    'Lexington',
    'Bowling Green',
    'Owensboro',
    'Covington'
  ],
  'Louisiana': [
    'New Orleans',
    'Baton Rouge',
    'Shreveport',
    'Lafayette',
    'Lake Charles'
  ],
  'Maine': ['Portland', 'Lewiston', 'Bangor', 'South Portland', 'Auburn'],
  'Maryland': ['Baltimore', 'Frederick', 'Rockville', 'Gaithersburg', 'Bowie'],
  'Massachusetts': [
    'Boston',
    'Worcester',
    'Springfield',
    'Lowell',
    'Cambridge'
  ],
  'Michigan': [
    'Detroit',
    'Grand Rapids',
    'Warren',
    'Sterling Heights',
    'Ann Arbor'
  ],
  'Minnesota': [
    'Minneapolis',
    'St. Paul',
    'Rochester',
    'Duluth',
    'Bloomington'
  ],
  'Mississippi': ['Jackson', 'Gulfport', 'Southaven', 'Hattiesburg', 'Biloxi'],
  'Missouri': [
    'Kansas City',
    'St. Louis',
    'Springfield',
    'Columbia',
    'Independence'
  ],
  'Montana': ['Billings', 'Missoula', 'Great Falls', 'Bozeman', 'Butte'],
  'Nebraska': ['Omaha', 'Lincoln', 'Bellevue', 'Grand Island', 'Kearney'],
  'Nevada': ['Las Vegas', 'Henderson', 'Reno', 'North Las Vegas', 'Sparks'],
  'New Hampshire': ['Manchester', 'Nashua', 'Concord', 'Derry', 'Dover'],
  'New Jersey': ['Newark', 'Jersey City', 'Paterson', 'Elizabeth', 'Edison'],
  'New Mexico': [
    'Albuquerque',
    'Las Cruces',
    'Rio Rancho',
    'Santa Fe',
    'Roswell'
  ],
  'New York': ['New York City', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse'],
  'North Carolina': [
    'Charlotte',
    'Raleigh',
    'Greensboro',
    'Durham',
    'Winston-Salem'
  ],
  'North Dakota': ['Fargo', 'Bismarck', 'Grand Forks', 'Minot', 'West Fargo'],
  'Ohio': ['Columbus', 'Cleveland', 'Cincinnati', 'Toledo', 'Akron'],
  'Oklahoma': ['Oklahoma City', 'Tulsa', 'Norman', 'Broken Arrow', 'Lawton'],
  'Oregon': ['Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro'],
  'Pennsylvania': [
    'Philadelphia',
    'Pittsburgh',
    'Allentown',
    'Erie',
    'Reading'
  ],
  'Rhode Island': [
    'Providence',
    'Warwick',
    'Cranston',
    'Pawtucket',
    'East Providence'
  ],
  'South Carolina': [
    'Columbia',
    'Charleston',
    'North Charleston',
    'Mount Pleasant',
    'Rock Hill'
  ],
  'South Dakota': [
    'Sioux Falls',
    'Rapid City',
    'Aberdeen',
    'Brookings',
    'Watertown'
  ],
  'Tennessee': [
    'Nashville',
    'Memphis',
    'Knoxville',
    'Chattanooga',
    'Clarksville'
  ],
  'Texas': ['Houston', 'San Antonio', 'Dallas', 'Austin', 'Fort Worth'],
  'Utah': [
    'Salt Lake City',
    'West Valley City',
    'Provo',
    'West Jordan',
    'Orem'
  ],
  'Vermont': [
    'Burlington',
    'South Burlington',
    'Rutland',
    'Barre',
    'Montpelier'
  ],
  'Virginia': [
    'Virginia Beach',
    'Norfolk',
    'Chesapeake',
    'Richmond',
    'Newport News'
  ],
  'Washington': ['Seattle', 'Spokane', 'Tacoma', 'Vancouver', 'Bellevue'],
  'West Virginia': [
    'Charleston',
    'Huntington',
    'Morgantown',
    'Parkersburg',
    'Wheeling'
  ],
  'Wisconsin': ['Milwaukee', 'Madison', 'Green Bay', 'Kenosha', 'Racine'],
  'Wyoming': ['Cheyenne', 'Casper', 'Laramie', 'Gillette', 'Rock Springs'],
};

List<String> usStates = [
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  'Delaware',
  'Florida',
  'Georgia',
  'Hawaii',
  'Idaho',
  'Illinois',
  'Indiana',
  'Iowa',
  'Kansas',
  'Kentucky',
  'Louisiana',
  'Maine',
  'Maryland',
  'Massachusetts',
  'Michigan',
  'Minnesota',
  'Mississippi',
  'Missouri',
  'Montana',
  'Nebraska',
  'Nevada',
  'New Hampshire',
  'New Jersey',
  'New Mexico',
  'New York',
  'North Carolina',
  'North Dakota',
  'Ohio',
  'Oklahoma',
  'Oregon',
  'Pennsylvania',
  'Rhode Island',
  'South Carolina',
  'South Dakota',
  'Tennessee',
  'Texas',
  'Utah',
  'Vermont',
  'Virginia',
  'Washington',
  'West Virginia',
  'Wisconsin',
  'Wyoming',
];
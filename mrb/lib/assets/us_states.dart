Map<String, List<String>> usStatesAndCities = {
  'All': ['All'],
  'Alabama': [
    'All',
    'Birmingham',
    'Montgomery',
    'Huntsville',
    'Mobile',
    'Tuscaloosa'
  ],
  'Alaska': ['All', 'Anchorage', 'Fairbanks', 'Juneau', 'Sitka', 'Ketchikan'],
  'Arizona': ['Phoenix', 'Tucson', 'Mesa', 'Chandler', 'Glendale'],
  'Arkansas': [
    'All',
    'Little Rock',
    'Fort Smith',
    'Fayetteville',
    'Springdale',
    'Jonesboro'
  ],
  'California': [
    'All',
    'Los Angeles',
    'San Francisco',
    'San Diego',
    'San Jose',
    'Sacramento'
  ],
  'Colorado': [
    'All',
    'Denver',
    'Colorado Springs',
    'Aurora',
    'Fort Collins',
    'Boulder'
  ],
  'Connecticut': [
    'All',
    'Bridgeport',
    'New Haven',
    'Hartford',
    'Stamford',
    'Waterbury'
  ],
  'Delaware': ['All', 'Wilmington', 'Dover', 'Newark', 'Middletown', 'Smyrna'],
  'Florida': [
    'All',
    'Miami',
    'Tampa',
    'Orlando',
    'Jacksonville',
    'St. Petersburg'
  ],
  'Georgia': ['All', 'Atlanta', 'Augusta', 'Columbus', 'Savannah', 'Macon'],
  'Hawaii': ['All', 'Honolulu', 'Pearl City', 'Hilo', 'Kailua', 'Waipahu'],
  'Idaho': ['All', 'Boise', 'Nampa', 'Meridian', 'Idaho Falls', 'Pocatello'],
  'Illinois': ['All', 'Chicago', 'Aurora', 'Rockford', 'Joliet', 'Naperville'],
  'Indiana': [
    'All',
    'Indianapolis',
    'Fort Wayne',
    'Evansville',
    'South Bend',
    'Carmel'
  ],
  'Iowa': [
    'All',
    'Des Moines',
    'Cedar Rapids',
    'Davenport',
    'Sioux City',
    'Iowa City'
  ],
  'Kansas': [
    'All',
    'Wichita',
    'Overland Park',
    'Kansas City',
    'Topeka',
    'Olathe'
  ],
  'Kentucky': [
    'All',
    'Louisville',
    'Lexington',
    'Bowling Green',
    'Owensboro',
    'Covington'
  ],
  'Louisiana': [
    'All',
    'New Orleans',
    'Baton Rouge',
    'Shreveport',
    'Lafayette',
    'Lake Charles'
  ],
  'Maine': [
    'All',
    'Portland',
    'Lewiston',
    'Bangor',
    'South Portland',
    'Auburn'
  ],
  'Maryland': [
    'All',
    'Baltimore',
    'Frederick',
    'Rockville',
    'Gaithersburg',
    'Bowie'
  ],
  'Massachusetts': [
    'All',
    'Boston',
    'Worcester',
    'Springfield',
    'Lowell',
    'Cambridge'
  ],
  'Michigan': [
    'All',
    'Detroit',
    'Grand Rapids',
    'Warren',
    'Sterling Heights',
    'Ann Arbor'
  ],
  'Minnesota': [
    'All',
    'Minneapolis',
    'St. Paul',
    'Rochester',
    'Duluth',
    'Bloomington'
  ],
  'Mississippi': [
    'All',
    'Jackson',
    'Gulfport',
    'Southaven',
    'Hattiesburg',
    'Biloxi'
  ],
  'Missouri': [
    'All',
    'Kansas City',
    'St. Louis',
    'Springfield',
    'Columbia',
    'Independence'
  ],
  'Montana': ['All', 'Billings', 'Missoula', 'Great Falls', 'Bozeman', 'Butte'],
  'Nebraska': [
    'All',
    'Omaha',
    'Lincoln',
    'Bellevue',
    'Grand Island',
    'Kearney'
  ],
  'Nevada': [
    'All',
    'Las Vegas',
    'Henderson',
    'Reno',
    'North Las Vegas',
    'Sparks'
  ],
  'New Hampshire': ['All', 'Manchester', 'Nashua', 'Concord', 'Derry', 'Dover'],
  'New Jersey': [
    'All',
    'Newark',
    'Jersey City',
    'Paterson',
    'Elizabeth',
    'Edison'
  ],
  'New Mexico': [
    'All',
    'Albuquerque',
    'Las Cruces',
    'Rio Rancho',
    'Santa Fe',
    'Roswell'
  ],
  'New York': [
    'All',
    'New York City',
    'Buffalo',
    'Rochester',
    'Yonkers',
    'Syracuse'
  ],
  'North Carolina': [
    'All',
    'Charlotte',
    'Raleigh',
    'Greensboro',
    'Durham',
    'Winston-Salem'
  ],
  'North Dakota': [
    'All',
    'Fargo',
    'Bismarck',
    'Grand Forks',
    'Minot',
    'West Fargo'
  ],
  'Ohio': ['All', 'Columbus', 'Cleveland', 'Cincinnati', 'Toledo', 'Akron'],
  'Oklahoma': [
    'All',
    'Oklahoma City',
    'Tulsa',
    'Norman',
    'Broken Arrow',
    'Lawton'
  ],
  'Oregon': ['All', 'Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro'],
  'Pennsylvania': [
    'All',
    'Philadelphia',
    'Pittsburgh',
    'Allentown',
    'Erie',
    'Reading'
  ],
  'Rhode Island': [
    'All',
    'Providence',
    'Warwick',
    'Cranston',
    'Pawtucket',
    'East Providence'
  ],
  'South Carolina': [
    'All',
    'Columbia',
    'Charleston',
    'North Charleston',
    'Mount Pleasant',
    'Rock Hill'
  ],
  'South Dakota': [
    'All',
    'Sioux Falls',
    'Rapid City',
    'Aberdeen',
    'Brookings',
    'Watertown'
  ],
  'Tennessee': [
    'All',
    'Nashville',
    'Memphis',
    'Knoxville',
    'Chattanooga',
    'Clarksville'
  ],
  'Texas': ['All', 'Houston', 'San Antonio', 'Dallas', 'Austin', 'Fort Worth'],
  'Utah': [
    'All',
    'Salt Lake City',
    'West Valley City',
    'Provo',
    'West Jordan',
    'Orem'
  ],
  'Vermont': [
    'All',
    'Burlington',
    'South Burlington',
    'Rutland',
    'Barre',
    'Montpelier'
  ],
  'Virginia': [
    'All',
    'Virginia Beach',
    'Norfolk',
    'Chesapeake',
    'Richmond',
    'Newport News'
  ],
  'Washington': [
    'All',
    'Seattle',
    'Spokane',
    'Tacoma',
    'Vancouver',
    'Bellevue'
  ],
  'West Virginia': [
    'All',
    'Charleston',
    'Huntington',
    'Morgantown',
    'Parkersburg',
    'Wheeling'
  ],
  'Wisconsin': [
    'All',
    'Milwaukee',
    'Madison',
    'Green Bay',
    'Kenosha',
    'Racine'
  ],
  'Wyoming': [
    'All',
    'Cheyenne',
    'Casper',
    'Laramie',
    'Gillette',
    'Rock Springs'
  ],
};

List<String> usStates = [
  'All',
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

class Books {
  Books({
    required this.title,
    required this.author,
    required this.image,
    required this.overview,
    required this.category,
  });

  String title;
  String author;
  String image;
  String category;
  String overview;


static List<Books> bookList = <Books>[
  // Self Help
  Books(
    title: 'The Art of War',
    author: 'Sun Tzu',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742803808/The_Art_of_War_-_Sun_Tzu_zbrkmo.jpg',
    overview: "The Art of War by Sun Tzu is an ancient Chinese military treatise that offers timeless strategies for conflict, leadership, and decision-making, emphasizing the importance of preparation, adaptability, and understanding one’s enemy to achieve victory without direct confrontation.",
    category: 'Self Help',
  ),
  Books(
    title: 'Atomic Habits',
    author: 'James Clear',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742804138/Atomic_Habits__The_life-changing_million-copy_1_bestseller_qkdiyv.jpg',
    overview: 'A practical guide to building good habits and breaking bad ones, using small, incremental changes to achieve remarkable results in personal growth.',
    category: 'Self Help',
  ),
  Books(
    title: 'The Power of Now',
    author: 'Eckhart Tolle',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742804355/The_Power_of_Now_om0dpz.jpg',
    overview: "A spiritual guide to living in the present moment, helping readers find peace and overcome negative thought patterns.",
    category: 'Self Help',
  ),
  Books(
    title: 'The 7 Habits of Highly Effective People',
    author: 'Stephen R. Covey',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742804445/The_7_Habits_Of_Highly_Effective_People__STEPHEN_R_COVEY__9782133487538__Amazon_com__Books_c9v5g5.jpg',
    overview: "A timeless self-help classic that outlines seven principles for personal and professional effectiveness, focusing on proactive habits and goal-setting.",
    category: 'Self Help',
  ),
  Books(
    title: 'Mindset: The New Psychology of Success',
    author: 'Carol S. Dweck',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742804540/Mindset__The_New_Psychology_of_Success_By_Carol_S__Dweck_Journey_To_Leadership_loahn8.jpg',
    overview: "Explores the concept of fixed and growth mindsets, showing how adopting a growth mindset can lead to success in education, business, and relationships.",
    category: 'Self Help',
  ),

  // Love
  Books(
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805012/Jane_Austen_s_Books_Include_Some_Deeply_Underrated_Classics_m8nnu0.jpg',
    overview: "A classic romance novel following Elizabeth Bennet and Mr. Darcy as they overcome pride, prejudice, and societal expectations to find love.",
    category: 'Love',
  ),
  Books(
    title: 'The Notebook',
    author: 'Nicholas Sparks',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805056/Book_Review__The_Notebook_vjth8t.jpg',
    overview: "A heartfelt story of enduring love between Noah and Allie, spanning decades and overcoming obstacles like class and memory loss.",
    category: 'Love',
  ),
  Books(
    title: 'Me Before You',
    author: 'Jojo Moyes',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805103/28_Great_Books_That_Are_Getting_the_Movie_Treatment_in_2016_uql2dj.jpg',
    overview: "A poignant tale of Louisa Clark and Will Traynor, exploring love, sacrifice, and life-altering choices.",
    category: 'Love',
  ),
  Books(
    title: 'Jane Eyre',
    author: 'Charlotte Brontë',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805149/100_Essential_Penguin_Classics___Penguin_Random_House_ltamwy.jpg',
    overview: "An orphaned governess finds love and independence with the brooding Mr. Rochester in this gothic romance.",
    category: 'Love',
  ),
  Books(
    title: 'Outlander',
    author: 'Diana Gabaldon',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805198/Romance_and_Suspense_with_a_hint_of_Make_Believe____e6xksv.jpg',
    overview: "A time-travel romance following Claire Randall and Jamie Fraser as they navigate love and danger in 18th-century Scotland.",
    category: 'Love',
  ),

  // Science Fiction
  Books(
    title: 'Dune',
    author: 'Frank Herbert',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805242/Dune_Dune_1_jo2pr3.jpg',
    overview: "A saga of politics, religion, and ecology on the desert planet Arrakis, centered on young Paul Atreides.",
    category: 'Science Fiction',
  ),
  Books(
    title: 'Foundation',
    author: 'Isaac Asimov',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805290/Foundation_hi6jsh.jpg',
    overview: "A visionary tale of a mathematician’s plan to preserve knowledge and shorten a galactic dark age.",
    category: 'Science Fiction',
  ),
  Books(
    title: 'Neuromancer',
    author: 'William Gibson',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805335/Neuromancer_tgl48k.jpg',
    overview: "A cyberpunk classic about a hacker navigating a world of artificial intelligence and corporate espionage.",
    category: 'Science Fiction',
  ),
  Books(
    title: 'The Left Hand of Darkness',
    author: 'Ursula K. Le Guin',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805374/25_Classic_Winter_Books_to_Read_by_the_Fire_l5ighg.jpg',
    overview: "An exploration of gender and humanity through an envoy’s mission on a planet with ambisexual inhabitants.",
    category: 'Science Fiction',
  ),
  Books(
    title: 'Snow Crash',
    author: 'Neal Stephenson',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805432/starsfive_intikj.jpg',
    overview: "A fast-paced cyberpunk thriller blending virtual reality, linguistics, and ancient mythology.",
    category: 'Science Fiction',
  ),

  // History
  Books(
    title: 'Guns, Germs, and Steel',
    author: 'Jared Diamond',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805514/Guns_Germs_and_Steel__The_Fates_of_Human_Societies_am2t5u.jpg',
    overview: "An analysis of how geography and environment shaped the course of human history and civilization.",
    category: 'History',
  ),
  Books(
    title: 'The Rise and Fall of the Third Reich',
    author: 'William L. Shirer',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805571/Rise_And_Fall_Of_The_Third_Reich_ltqmi9.jpg',
    overview: "A detailed account of Nazi Germany’s ascent, reign, and collapse during the 20th century.",
    category: 'History',
  ),
  Books(
    title: 'Sapiens: A Brief History of Humankind',
    author: 'Yuval Noah Harari',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805622/Sapiens__A_Brief_History_of_Humankind_rb7wdd.jpg',
    overview: "A sweeping narrative of human history, from the Stone Age to the modern era.",
    category: 'History',
  ),
  Books(
    title: 'The Diary of a Young Girl',
    author: 'Anne Frank',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805689/The_Diary_of_a_Young_Girl_dquwvb.jpg',
    overview: "A poignant firsthand account of a Jewish girl hiding from the Nazis during World War II.",
    category: 'History',
  ),
  Books(
    title: "A People’s History of the United States",
    author: 'Howard Zinn',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805750/A_People_s_History_of_the_United_States__1492_to_Present_h7z9nq.jpg',
    overview: "A retelling of U.S. history from the perspective of marginalized groups and ordinary people.",
    category: 'History',
  ),

  // Mystery
  Books(
    title: 'The Girl with the Dragon Tattoo',
    author: 'Stieg Larsson',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742805805/The_Girl_with_the_Dragon_Tattoo_v3xqku.jpg',
    overview: "A journalist and hacker uncover dark secrets while investigating a decades-old disappearance.",
    category: 'Mystery',
  ),
  Books(
    title: 'The Big Sleep',
    author: 'Raymond Chandler',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742806889/Lauren_Bacall_and_Humphrey_Bogart_kacigj.jpg',
    overview: "Hard-boiled detective Philip Marlowe navigates blackmail and murder in 1930s Los Angeles.",
    category: 'Mystery',
  ),
  Books(
    title: 'And Then There Were None',
    author: 'Agatha Christie',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742806940/114_Of_the_Best-Selling_Books_That_Might_Make_A_Great_Addition_To_Your_Library_aelmcb.jpg',
    overview: "Ten strangers are lured to an island and systematically killed off in a chilling whodunit.",
    category: 'Mystery',
  ),
  Books(
    title: 'The Name of the Rose',
    author: 'Umberto Eco',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742806985/The_Name_of_the_Rose_kkfjm6.jpg',
    overview: "A medieval monk investigates mysterious deaths in a secluded abbey filled with secrets.",
    category: 'Mystery',
  ),
  Books(
    title: 'In the Woods',
    author: 'Tana French',
    image: 'https://res.cloudinary.com/dybhtbnes/image/upload/v1742807050/In_the_Woods_Dublin_Murder_Squad_1_hlfkjg.jpg',
    overview: "A detective with a haunted past investigates a child’s murder in a small Irish town.",
    category: 'Mystery',
  ),
];
}
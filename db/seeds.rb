# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Publisher.create(name: 'Rocco', country: 'Brazil')
Publisher.create(name: 'Pearson', country: 'United Kingdom')
Publisher.create(name: 'Holtzbrinck', country: 'Germany')
Publisher.create(name: 'Oxford University Press', country: 'United Kingdom')
Publisher.create(name: 'Simon & Schuster', country: 'United States')
Publisher.create(name: 'Mondadori', country: 'Italy')
Publisher.create(name: 'Saraiva', country: 'Brazil')
Publisher.create(name: 'Atlas', country: 'Brazil')
harper_collins = Publisher.create(name: 'HarperCollins', country: 'United States')
presenca = Publisher.create(name: 'Presenca', country: 'Brazil')

Author.create(first_name: 'Joanne', last_name: 'Rowling', birthday: '1965-07-31', country: 'United Kingdom')
Author.create(first_name: 'Arthur', last_name: 'Doyle', birthday: '1930-07-07', country: 'United Kingdom')
Author.create(first_name: 'Agatha', last_name: 'Christie', birthday: '1890-09-15', country: 'United Kingdom')
c_s_lewis = Author.create(first_name: 'Clive', last_name: 'Lewis', birthday: '1898-11-22', country: 'United Kingdom')
Author.create(first_name: 'George', last_name: 'Martin', birthday: '1948-09-20', country: 'United States')
jo_soares = Author.create(first_name: 'Jo', last_name: 'Soares', birthday: '1938-01-16', country: 'Brazil')

Book.create(title: 'The Chronicles of Narnia - The Magician\'s Nephew', author: c_s_lewis, publisher: harper_collins, description: 'Witness the creation of a magical land in The Magician's Nephew, the first title in C. S. Lewis's classic fantasy series, which has captivated readers of all ages for over sixty years. This beautiful hardcover edition features jacket art by three-time Caldecott Medal-winning illustrator David Wiesner and black-and-white interior art by the series', published_at: '1996-01-01', average_rating: 4.8, pages_count: 522, category: 'fantasy')
Book.create(title: 'O Xango de Baker Street', author: jo_soares, publisher: presenca, description: 'A diva francesa Sarah Bernhardt pela primeira vez se apresenta no Brasil. O público se curva perante o talento de Sarah, incluindo o imperador Dom Pedro II, que lhe conta um segredo: um valioso violino Stradivarius, um presente seu à baronesa Maria Luíza, desaparecera misteriosamente.', published_at: '1996-01-01', average_rating: 4.1, pages_count: 325, category: 'drama')

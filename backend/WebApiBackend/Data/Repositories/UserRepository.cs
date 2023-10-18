// .\Data\Repositories\UserRepository.cs

using Microsoft.EntityFrameworkCore;

namespace Data
{
    public class UserRepository
    {
        private readonly ApplicationDbContext _context;

        public UserRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public User? Get(string UsernameOrMail)
        {
            return _context.Users.FirstOrDefault(u => u.Username == UsernameOrMail || u.Email == UsernameOrMail);
        }
        public bool Exists(string Username,string Email)
        {
            return _context.Users.Any(u => u.Username == Username || u.Email == Email);
        }
        public void Add(User user)
        {
            _context.Users.Add(user);
            _context.SaveChanges();
        }

        public void Update(User user)
        {
            _context.Users.Update(user);
            _context.SaveChanges();
        }
    }
}
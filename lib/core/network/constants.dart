const supabaseBaseUrl = 'https://gyhawsifbnfeouzusdpv.supabase.co';
const supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd5aGF3c2lmYm5mZW91enVzZHB2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ2NTMzNTMsImV4cCI6MjA3MDIyOTM1M30.Qky7m6naQX4m0ZuVeXGXJLyZol-PG1kaJUoynFGCuCk';
const apiBaseUrl = 'https://gyhawsifbnfeouzusdpv.supabase.co/rest/v1/';
const usersTable = 'users';

const allAdvertismentsTable = 'advertisements';
const favouritesTable = 'favourites';

const myFavouritesAdvertisementsEndPoint =
    '$allAdvertismentsTable?select=*,$favouritesTable(*)';

const advertiseImagesBucket = 'advertise_images';
const usersImagesBucket = 'users_images';
const ratesTable = 'rates';

const getMyRatesEndPoint = 'users?select=*,rates(*)';

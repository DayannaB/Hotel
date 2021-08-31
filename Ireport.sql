select to_char( fechainicioalojamiento,'YYYY') as año, count(idalojamiento) as cantidad from estancia
group by año

class AnalizadorLinea

  attr_reader :content, :numero_linea, :max_frec_palabras, :max_frec_count

  def initialize(content, numero_linea)
    #inicializar context, numero_linea, max_frec_palabras
    @content = content
    @numero_linea = numero_linea
    @max_frec_palabras =[]
    @max_frec_count = 0

    #invocar a calcular_frecuencia_palabras (metodo de instancia)
    calcular_frecuencia_palabras()

  end

  def calcular_frecuencia_palabras()
    #Por cada palabra que aparece en la linea (content) calcular la cantidad de veces que se repite
    frecuencia = Hash.new {0}
    # Almacenar este contador en @max_frec_palabras
    content.split.each do|palabra|
      frecuencia[palabra.downcase] += 1
    end
    p frecuencia

    #Ademas calcular en @max_frec_count el nro. máximo entre las frecuencias.
    @max_frec_count = frecuencia.values.max
    frecuencia.each do |key, value|
      if value == @max_frec_count
        @max_frec_palabras.push(key)

      end
    end

  end

end


class Solution
  def initialize()
    #inicializar varialbels> analizadores, max_count_across_lines, max_count_palabras_across_lines
    @analizadores = []
    @max_count_across_lines = 0
    @max_count_palabras_across_lines = []

  end

  def analizar_archivo()
    #leer el archivo test.txt por linea
    numero_linea=0
    if File.exist? 'test.txt'
      File.foreach( 'test.txt' ) do |content|
        analizador = AnalizadorLinea.new(content, numero_linea)
        @analizadores.push(analizador)
        numero_linea += 1
      end
    end

    #crear analizadores de linesa
  end

  def calcular_linea_mayor_frecuencia()
    #recorrer los analizadores de linea y buscar cual es el maximo max_frec_count
    #identificar cuales son las linesa que cuentan con palabras repetidas el maximo nro. de veces
    #cargar las lineas en la variable @max_count_palabras_across_linesal

    @analizadores.each do |element|
      if @max_count_across_lines < element.max_frec_count
        @max_count_across_lines = element.max_frec_count

      end
    end
    @analizadores.each do |element|
      if @max_count_across_lines == element.max_frec_count
        @max_count_palabras_across_lines.push(element)

      end
    end

  end
  def print_palabras_mayor_frecuencia()
    #recorrer @max_count_across_linespalabras_across_lines (que tiene analizadores y los analizadores de palabras)
    #puts "{palabra}" (aparece en la linea #{analizador.numero_linea})
    @max_count_palabras_across_lines.each do |element|
      element.max_frec_palabras.each do |b|
        puts "#{b} (aparece en la linea #{element.numero_linea})"
      end
    end
  end

end

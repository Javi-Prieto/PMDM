// Generated by https://quicktype.io

// Generated by https://quicktype.io

export interface AlumnosResponse {
    count:   number;
    results: Alumnos[];
}

export interface Alumnos {
    nombre:    string;
    apellidos: string;
    id_alumno: number;
    edad:      number;
    sexo:      string;
    modulos:   Modulo[];
}

export interface Modulo {
    nombre: string;
    horas:  number;
}


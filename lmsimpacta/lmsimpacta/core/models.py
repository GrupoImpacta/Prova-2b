# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.


from django.db import models
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager

from core.models import *


#from django.contrib.auth.models import User
class UsuarioManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, ra, password, **extra_fields):
        if not ra:
            raise ValueError('RA precisa ser preenchido')
        user = self.model(ra=ra, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, ra, password=None, **extra_fields):
        return self._create_user(ra, password, **extra_fields)

    def create_superuser(self, ra, password, **extra_fields):
        return self._create_user(ra, password, **extra_fields)


class Usuario(AbstractBaseUser):
    id = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    ra = models.IntegerField(unique=True)
    email = models.CharField(max_length=100)
    password = models.CharField(max_length=150)
    perfil = models.CharField(max_length=1, default='C')
    ativo = models.BooleanField(default=True)

    USERNAME_FIELD = 'ra'
    REQUIRED_FIELDS = ['nome']

    objects = UsuarioManager()

    @property   #Objetos para roubar
    def is_staff(self):
        return self.perfil == 'C'  


    def has_perm(self, perm, obj=None):
        return True
    def has_module_perms(self, app_label):
        return True


    def get_short_name(self):
        return self.nome
    def get_full_name(self):
        return self.nome

    def __str__(self):
        return self.nome





class Aluno(Usuario):
    celular = models.CharField(max_length=50)
    #confirma_matricula = models.ForeignKey(to='Matricula',related_name="data_aluno",db_column="nome_matricula")
    #curso = models.ForeignKey(to='Curso',related_name="curso_aluno",db_column="sigla_curso")
    turma = models.ForeignKey(to='Turma',related_name="turma_aluno",db_column="turma")

    def __str__(self):
        return '%s' % int(self.ra)

 

class Professor(Usuario):
    apelido = models.CharField(max_length=30,unique = True, null = True)

    def __str__(self):
        return self.nome 
 


class Disciplina(models.Model):
    nome = models.CharField(max_length=240,unique=True)
    carga_horaria = models.SmallIntegerField()
    teoria = models.DecimalField(max_digits=3,decimal_places=2)
    pratica = models.DecimalField(max_digits=3,decimal_places=2)
    ementa = models.TextField()
    competencias = models.TextField()
    habilidades = models.TextField()
    conteudo = models.TextField()
    bibliografia_complementar = models.TextField()
    bibliografia_basica = models.TextField()

    def __str__(self):
        return "{}".format(self.nome)

    class Meta:
        db_table = 'Disciplina'


        
class Matricula(models.Model):
    ra = models.ForeignKey(to='Aluno',related_name="Matriculas", null=False, blank=False,unique=True)
    disciplina = models.ForeignKey(to='DisciplinaOfertada', related_name = 'Mat_DO_D', null=False)
    ano = models.ForeignKey(to='DisciplinaOfertada', related_name = 'Mat_DO_A', null=False)
    semestre = models.ForeignKey(to='DisciplinaOfertada', related_name = 'Mat_DO_S',  null=False)
    turma = models.ForeignKey(to='Turma', related_name = 'Matricula_Turma',  null=False)

    def __str__(self):
        return '%s - %s' % (self.ra, self.turma)

    class Meta:
        db_table = 'Matricula'

class DisciplinaOfertada(models.Model):
    disciplina = models.ForeignKey(to='Disciplina', related_name="disciplinasOfertadas", null=False, blank=False) #onetomany
    ano = models.SmallIntegerField(null=False)
    semestre = models.CharField(max_length=1,null=False)

    def __str__(self):
        return "{}: {} - {}".format(self.disciplina, self.ano, self.semestre)
    class Meta:
        db_table = 'DisciplinaOfertada'


class Curso(models.Model):

    sigla = models.CharField(max_length=5,unique=True,null=False)
    nome = models.CharField(max_length=50,unique=True,null=False)
    

    def __str__(self):
        return "{} - {}".format(self.sigla,self.nome)

    class Meta:
        db_table = 'Curso'                



class GradeCurricular(models.Model):
    curso = models.ForeignKey(to='Curso', related_name="gradesCurriculares", null=False, blank=False) #onetomany
    ano = models.SmallIntegerField(null=False)
    semestre = models.CharField(max_length=1,null=False)
    
    def __str__(self):
        return "{}: {} - {}".format(self.curso, self.ano, self.semestre)

    class Meta:
        db_table = 'GradeCurricular'


class Periodo(models.Model):
    gradeCurricular = models.ForeignKey(to='GradeCurricular', related_name="periodos", null=False, blank=False) 
    numero = models.SmallIntegerField(null=False) 
    disciplinas = models.ManyToManyField('Disciplina', db_table='PeriodoDisicplina', related_name='periodos', blank=False)

    def __str__(self):
        return "{}: {} - {}".format(self.numero,self.gradeCurricular,self.disciplinas)

    class Meta:
        db_table = 'Periodo'


class Turma(models.Model):
    
    disciplinaOfertada = models.ForeignKey(to='DisciplinaOfertada', related_name="turmas", null=False, blank=False) 
    professor = models.ForeignKey(to='Professor', related_name="turmas", null=False, blank=False) 
    turno = models.CharField(max_length=15)
    turma_sigla = models.CharField(max_length=1,unique=True)
    cursos = models.ManyToManyField('Curso', db_table='CursoTurma', related_name='turmas', blank=False)

    def __str__(self):
        return "{} " .format(self.turma_sigla)

    class Meta:
        db_table = 'Turma'  

def monta_arquivo(questao,nome_arquivo):
    return "{}/{}/{}".format(questao.turma.turma_sigla, questao.numero,nome_arquivo)

class Questao(models.Model):
    turma = models.ForeignKey(Turma)
    numero = models.IntegerField("Numero")
    entrega = models.DateField("Entrega")
    arquivo = models.FileField(upload_to=monta_arquivo)   

    def __str__(self):
        return "{}".format(self.numero)                   


      


        



from django.shortcuts import render, redirect

from core.models import *
from core.forms import *

def index(request):
    contexto = {
        "cursos":Curso.objects.all()
    }
    return render(request,"index.html",contexto)

def curso(request, sigla):
    contexto = {
        "curso":Curso.objects.get(sigla=sigla.upper())
    }
    return render(request,"curso.html",contexto)

def contato(request):
    if request.POST:
        form = ContatoForm(request.POST)
        if form.is_valid():
            form.envia_email()
    else:
        form = ContatoForm()

    contexto = {
        "form":form
    }
    return render(request,"contato.html",contexto)

def restrito(request):
    cursos = Curso.objects.all()
    for curso in cursos:
        curso.questoes = Questao.objects.filter(curso=curso)
    contexto = {
        "cursos":cursos
    }
    return render(request,"restrito.html",contexto)

def questao_form(request, sigla, questao_id=None):
    curso = Curso.objects.get(sigla=sigla)

    if questao_id:
        questao = Questao.objects.get(id=questao_id)
    else:
        questao = Questao(curso=curso)

    if request.POST:
        form = QuestaoForm(request.POST, request.FILES, instance=questao)
        if form.is_valid():
            form.save()
            return redirect("/restrito")
    else:
        form = QuestaoForm(instance=questao)

    contexto = {
        "form":form,
        "curso":curso
    }
    return render(request,"questao_form.html",contexto)

def aluno(request):
    aluno = Aluno()
    

    if request.POST:
        form = AlunoForm(request.POST)
        
        if form.is_valid():
            
            curso_id=request.POST.get('curso_id')
            
            curso = Curso.objects.get(id=curso_id)

            aluno.ra = form.cleaned_data['ra']
            aluno.nome = form.cleaned_data['nome']
            aluno.email = form.cleaned_data['email']
            aluno.curso = curso
            aluno.save()
    
    contexto = {
                "alunos":Aluno.objects.all(),
                "cs":Curso.objects.all()
                }

    return render(request,"aluno.html",contexto)

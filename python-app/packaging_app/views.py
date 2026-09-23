from django.http import HttpResponse


def home(request):
    return HttpResponse("""
        <h1>Software Packaging Project</h1>
        <p>Django application is running successfully.</p>
        <p>Framework: Django</p>
        <p>Version: 1.0.0</p>
    """)

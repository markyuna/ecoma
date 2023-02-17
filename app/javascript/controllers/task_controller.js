import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card"]

  destroy() {
    if (confirm("Êtes-vous sûr de vouloir supprimer cette tâche ?")) {
      console.log('delete task')
      const taskId = this.cardTarget.dataset.taskId
      fetch(`/tasks/${taskId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({})
      })
      .then(response => {
        if (response.ok) {
          this.cardTarget.remove()
        } else {
          throw new Error(`Erreur HTTP ${response.status} - ${response.statusText}`)
        }
      })
      .catch(error => {
        console.error(error)
      })
    }
  }
}

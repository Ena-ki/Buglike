extends Area2D

var damage = 15
var creator = null # 이 히트박스를 생성한 플레이어 (자신에게 피해를 주지 않기 위함)

func _ready():
    # 충돌 감지 시 _on_body_entered 함수를 호출하도록 연결합니다.
  body_entered.connect(_on_body_entered)
    # 히트박스가 생성된 후 0.25초 뒤에 자동으로 사라지도록 타이머를 설정합니다.
    # (아무것도 맞추지 못해도 사라지게 하여 불필요하게 남아있지 않도록 합니다.)
  var timer = get_tree().create_timer(0.25)
  timer.timeout.connect(queue_free)

  # 다른 물리 객체(body)가 이 히트박스 영역 안으로 들어왔을 때 호출됩니다.
func _on_body_entered(body):
    # 히트박스를 생성한 플레이어 자신에게는 피해를 주지 않습니다.
  if body == creator:
    return

    # 충돌한 객체가 'damage' 함수를 가지고 있다면 피해를 줍니다.
  if body.has_method("damage"):
    body.damage(damage)
      # 한 번 피해를 준 후에는 히트박스를 제거하여 중복 피해를 막습니다.
    queue_free()

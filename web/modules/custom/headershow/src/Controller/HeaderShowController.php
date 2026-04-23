<?php

namespace Drupal\headershow\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\RequestStack;

class HeaderShowController extends ControllerBase {

  protected RequestStack $requestStack;

  public function __construct(RequestStack $request_stack) {
    $this->requestStack = $request_stack;
  }

  public static function create($container) {
    return new static(
      $container->get('request_stack')
    );
  }

  public function page(): array {
    $request = $this->requestStack->getCurrentRequest();
    $headers = $request->headers->all();

    $output = [];

    foreach ($headers as $name => $values) {
      $output[] = $name . ': ' . implode(', ', $values);
    }

    return [
      '#type' => 'markup',
      '#markup' => '<pre>' . htmlspecialchars(implode("\n", $output)) . '</pre>',
    ];
  }

}
